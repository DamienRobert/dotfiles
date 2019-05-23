#!/usr/bin/perl
# vim:fdm=marker:

package Cigrip;

use strict;
use warnings;
use utf8;
use File::stat;
use Fcntl;
use Unicode::Normalize;
use Time::HiRes "time";
use Exporter;
use base "Exporter";
our @EXPORT = ("video", "run", "mkchap", "text_to_filename");

########################################################################{{{
# Startup function
###########################################################################

if($0 =~ /(.*)\/Cigrip\.pm$/) {
  print <<EOF ;
#!/usr/bin/perl

use lib "$1";
use Cigrip;

video
  src => [qw{-dvd-device dvd dvd://1}],
  out => "file.mkv",
  title => "Title",
  tmp => "tmp-",
  chapters => "auto",
  video => {
    codec => "x264",
    quantizer => 22,
    scale => "720x405",
    crop => "L8 R8 T2 B3",
    hqdn3d => 1,
    options => [qw{...}],
  },
  audio => [
    {
      lang => "ja",
      quality => 4,
      options => [qw{...}],
      volume => 0,
    },
  ],
  subtitles => [
    { lang => "fr", file => "file.ass" },
    { lang => "fr", options => [qw{...}] }
  ];
run;
EOF
  chmod 0755, \*STDOUT if -f STDOUT;
  exit;
}

# }}}

########################################################################{{{
# Tasks scheduling
###########################################################################

my @tasks;
my %tokens;

my @tasks_done;
my @tasks_running;
my @tasks_failed;
my $tasks_last_progress = 0;
my $tasks_progress_interval = $ENV{PROGRESS_INTERVAL} || 1;

sub init_tokens() {
  $tokens{io} = 1;
  $tokens{cpu} = 1;
  if(open my $proc, "<", "/proc/cpuinfo") {
    $tokens{cpu}--;
    while(<$proc>) {
      $tokens{cpu}++ if /processor\s+:/;
    }
  }
}

sub file_mtime($) {
  my ($f) = @_;
  my $s = stat $f;
  return $s ? $s->mtime : undef;
}

sub task_add($) {
  my ($t) = @_;
  push @tasks, $t;
}

sub task_runnable($) {
  my ($t) = @_;
  for my $token (@{$t->{need_tokens}}) {
    return 0 if $tokens{$token} == 0;
  }
  for my $d (@{$t->{need_tasks}}) {
    return 0 if !$d->{done};
  }
  my $if_mtime = -1000000000;
  for my $if (@{$t->{input_files}}) {
    my $ifm = file_mtime $if;
    return 0 unless defined $ifm;
    $if_mtime = $ifm if $ifm > $if_mtime;
  }
  my $of_mtime = +10000000000;
  for my $of (@{$t->{output_files}}) {
    my $ofm = file_mtime $of;
    $ofm = -1000000001 unless defined $ofm;
    $of_mtime = $ofm if $ofm < $of_mtime;
  }
  return -1 if $of_mtime > $if_mtime;
  return 1;
}

sub task_run($) {
  my ($t) = @_;
  print "Running ", $t->{name}, "\n";
  push @tasks_running, $t;
  pipe my $from_task, my $task_to or die;
  $t->{reap_info} = $t->{run}->($task_to);
  $t->{progress_handle} = $from_task;
  $t->{progress_buffer} = "";
  $t->{progress_info} = "?";
  $t->{full_output} = "";
  for my $token (@{$t->{need_tokens}}) {
    $tokens{$token}--;
  }
}

sub task_reap($) {
  my ($t) = @_;
  @tasks_running = grep { $_ != $t } @tasks_running;
  my $reap = $t->{reap_info};
  my $failed = 0;
  for my $pid (@{$reap->{children}}) {
    waitpid $pid, 0 or die;
    $failed++ if $?;
  }
  for my $pid (@{$reap->{children_ignore}}) {
    waitpid $pid, 0 or die;
  }
  if($failed) {
    print "Failed ", $t->{name}, "\n";
    my $c = $t->{full_output};
    $c =~ s/^.*\r//gm;
    print $c;
    #for my $f (@{$reap->{tmpfiles}}) {
    #  unlink "$f.tmp";
    #}
    push @tasks_failed, $t;
    return;
  }
  for my $f (@{$reap->{tmpfiles}}) {
    rename "$f.tmp", $f or die "$f: $!\n";
  }
  push @tasks_done, $t;
  print "Done ", $t->{name}, "\n";
  for my $token (@{$t->{need_tokens}}) {
    $tokens{$token}++;
  }
  $t->{done} = 1;
}

sub tasks_find_runnable() {
  my @tasks_again;
  my $task;
  return undef if @tasks_failed;
  while(my $t = shift @tasks) {
    my $r = task_runnable $t;
    if($r == 0) {
      push @tasks_again, $t;
    } elsif($r == -1) {
      $t->{done} = 1;
      push @tasks_done, $t;
    } else {
      $task = $t;
      last;
    }
  }
  @tasks = (@tasks_again, @tasks);
  return $task;
}

sub tasks_wait_running() {
  while(1) {
    my $rin = "";
    for my $t (@tasks_running) {
      vec($rin, fileno($t->{progress_handle}), 1) = 1;
    }
    select $rin, undef, undef, undef or die;
    for my $t (@tasks_running) {
      next unless vec($rin, fileno($t->{progress_handle}), 1);
      my $l = sysread $t->{progress_handle}, my $buf, 65536;
      if($l) {
	$t->{full_output} .= $buf;
	$t->{progress_buffer} .= $buf;
	local $_ = $t->{progress_buffer};
	my $p = $t->{progress_parse}->();
	$t->{progress_buffer} = $_;
	$t->{progress_info} = $p if defined $p;
      } else {
	task_reap $t;
	return;
      }
    }
    my $time = time;
    if($time >= $tasks_last_progress + $tasks_progress_interval) {
      my $pt;
      for my $t (@tasks_running) {
	$pt .= $t->{name} . ": " . $t->{progress_info} . "; ";
      }
      $pt =~ s/; $//;
      while(length $pt > 79) {
	$pt =~ s/(\S{8,})[^\s:]/$1/g or last;
      }
      {
	local $| = 1;
	print $pt, "\r";
      }
      print "\e[K"; # hack: this is kept in the buffer and erases on next print
      $tasks_last_progress = $time;
    }
  }
}

sub run {
  $ENV{LC_CTYPE} = "en_US.UTF-8";
  init_tokens;
  while(1) {
    if(my $t = tasks_find_runnable) {
      task_run $t;
    } else {
      last unless @tasks_running;
      tasks_wait_running;
    }
  }
  if(@tasks_failed) {
    die "The following tasks have failed:\n  ",
      join("\n  ", map { $_->{name} } @tasks_failed), "\n";
  }
  if(@tasks) {
    die "The following tasks can not be completed:\n  ",
      join("\n  ", map { $_->{name} } @tasks), "\n";
  }
}

# }}}

########################################################################{{{
# Auxiliary system functions
###########################################################################

sub ref_or_str($) {
  my ($o) = @_;
  if(defined $o) {
    return ref $o ? @$o : ($o);
  } else {
    return ();
  }
}

sub run_command($$$@) {
  my ($fh_in, $fh_out, $fh_err, @cmd) = @_;
  if(0) {
    print "Run:\n";
    for my $c (@cmd) {
      print "  [$c]\n";
    }
  }
  my $child = fork;
  die unless defined $child;
  if(!defined $fh_in) {
    open $fh_in, "<", "/dev/null" or die $!;
  }
  die unless defined $fh_out;
  die unless defined $fh_err;
  if($child == 0) {
    open STDIN, "<&", $fh_in or die $!;
    open STDOUT, ">&", $fh_out or die $!;
    open STDERR, ">&", $fh_err or die $!;
    exec @cmd;
    exit 1;
  }
  return $child;
}

sub run_pipeline($$$@) {
  my ($fh_in, $fh_out, $fh_err, @cmd) = @_;
  my $fh_rd = $fh_in;
  my @pid;
  for my $i (0 .. $#cmd) {
    my @cmdi = @{$cmd[$i]};
    my $fh_wr;
    my $fh_rd2;
    if($i < $#cmd) {
      pipe $fh_rd2, $fh_wr;
    } else {
      $fh_wr = $fh_out;
    }
    my $strange_pipe = 0;
    for my $j (0 .. $#cmdi) {
      if($cmdi[$j] eq "/dev/fd/|") {
	$cmdi[$j] = "/dev/fd/" . fileno($fh_wr);
	$strange_pipe = 1;
      }
    }
    my $fh_wr_r = $fh_wr;
    if($strange_pipe) {
      fcntl $fh_wr, F_SETFD, fcntl($fh_wr, F_GETFD, 0) & ~FD_CLOEXEC;
      $fh_wr_r = $fh_out;
    }
    $pid[$i] = run_command $fh_rd, $fh_wr_r, $fh_err, @cmdi;
    $fh_rd = $fh_rd2;
  }
  return @pid;
}

sub parse_mencoder() {
  my $r;
  while(s/^(.*?)[\r\n]//) {
    my $l = $1;
    $r = $1 if $l =~ /^Pos:\s*(\d+\.\d+)/;
  }
  return $r;
}

sub parse_mkvmerge() {
  my $r;
  while(s/^(.*?)[\r\n]//) {
    my $l = $1;
    $r = $1 if $l =~ /rogress:\s*(\d+\%)/;
  }
  return $r;
}

sub parse_ffmpeg() {
  my $r;
  while(s/^(.*?)[\r\n]//) {
    my $l = $1;
    $r = $1 if $l =~ /time=(\d+\.\d+)/g;
  }
  return $r;
}

my %identify_cache;
sub identify(@) {
  my (@cmd) = @_;
  # XXX remove -frames option
  my $cmd = "@cmd";
  return %{$identify_cache{$cmd}} if exists $identify_cache{$cmd};
  my @fcmd = ("mplayer", "-identify", "-vo", "null", "-ao", "null",
    "-frames", "1", "-really-quiet", @cmd);
  my $pid = open my $m, "-|";
  die $! unless defined $pid;
  if($pid == 0) {
    open STDERR, ">", "/dev/null" or die;
    exec @fcmd;
    exit 1;
  }
  my %r;
  while(<$m>) {
    s/^CHAPTERS: /CHAPTERS=/;
    $r{$1} = $2 if /^(\w+)=(.*)/;
  }
  $identify_cache{$cmd} = \%r;
  return %r;
}

sub create_parent_dirs($) {
  my ($dir) = @_;
  my @dir = split "/", $dir, -1;
  pop @dir;
  my $d = "";
  for my $dc (@dir) {
    $d .= $dc;
    mkdir $d unless -e $d;
    $d .= "/";
  }
}

# }}}

########################################################################{{{
# Video encoding
###########################################################################

sub codec_options_x264($$) {
  my ($video, $log_fh) = @_;
  my $video_quantizer = $video->{quantizer};
  my $video_preset = $video->{preset} || "veryslow";
  #my @x264_options = (
  #  "frameref=8", # included in veryslow more strongly
  #  "bframes=2", # included in veryslow more strongly
  #  "8x8dct", # included in veryslow
  #  "me=umh", # included in veryslow
  #  "subq=7", # included in veryslow more strongly
  #  "crf=$video_quantizer", # necessary
  #  "nodct_decimate", # probably not a good idea
  #  "trellis=2", # included in veryslow
  #  "weight_b", # default
  #  "direct_pred=auto", # useful
  #);
  # veryslow =
  #   b_adapt=2
  #   b_frames=8
  #   direct=auto
  #   me=umh
  #   me_range=24
  #   partitions=all
  #   ref=16
  #   subq=10
  #   trellis=2
  #   rc_lookahead=60
  my @x264_options = (
    "preset=$video_preset",
    "direct_pred=auto",
    "crf=$video_quantizer",
  );
  push @x264_options, "tune=" . $video->{tune} if $video->{tune};
  my $x264_options = join ":", @x264_options;
  return ("-ovc", "x264", "-x264encopts", $x264_options);
}

sub codec_options_xvid($$) {
  my ($video, $log_fh) = @_;
  my $video_quantizer = $video->{quantizer};
  my @xvid_options = (
    "vhq=4",
    "autoaspect",
    "fixed_quant=$video_quantizer",
  );
  my $xvid_options = join ":", @xvid_options;
  return ("-ovc", "xvid", "-xvidencopts", $xvid_options);
}

sub video_encode_video($$) {
  my ($args, $log_fh) = @_;
  my @src = ref_or_str($args->{src});
  my $video = $args->{video};

  my @cmd = @src;
  push @cmd, ref_or_str($video->{options});
  my %identify = identify @cmd;
  push @cmd, ref_or_str($video->{enc_options});

  # Video filters
  # In order
  # 10 pp=fd
  # 20 scale=
  # 20 crop=
  # 20 dsize=
  # 30 hqdn3d=
  # 40 harddup=
  # 40 fixpts=

  my @video_filters;
  #push @video_filters, [ 10.1, "pp=fd" ]
  push @video_filters, [ 10.1, "yadif" ]
    unless exists $video->{deint} && !$video->{deint};

  my $src_width = $identify{ID_VIDEO_WIDTH};
  my $src_height = $identify{ID_VIDEO_HEIGHT};
  my $scl_width = $src_width;
  my $scl_height = $src_height;
  if(my $scale = $video->{scale}) {
    ($scl_width, $scl_height) = $scale =~ /(\d+)x(\d+)/
      or die "Invalid scale: $scale\n";
    push @video_filters, [ 20.1, "scale=$scl_width:$scl_height" ];
  }

  my $crop_width = $scl_width;
  my $crop_height = $scl_height;
  if(my $crop = $video->{crop}) {
    my $x = 0;
    my $y = 0;
    $x = $1 if $crop =~ /L\s*(\d+)/;
    $y = $1 if $crop =~ /T\s*(\d+)/;
    $crop_width -= $x;
    $crop_height -= $y;
    $crop_width -= $1 if $crop =~ /R\s*(\d+)/;
    $crop_height -= $1 if $crop =~ /B\s*(\d+)/;
    push @video_filters, [ 20.2, "crop=$crop_width:$crop_height:$x:$y" ];
  }
  if(my $dsize = $video->{dsize}) {
    $dsize =~ s/x/:/;
    $dsize = "$crop_width:$crop_height" if $dsize eq "auto";
    push @video_filters, [ 20.3, "dsize=$dsize" ];
  }

  my $hqdn3d = $video->{hqdn3d};
  if(defined $hqdn3d) {
    if($hqdn3d) {
      $hqdn3d = sprintf "%f:%f:%f", $hqdn3d * 4, $hqdn3d * 3, $hqdn3d * 6
	unless $hqdn3d =~ /:/;
    }
    push @video_filters, [ 30.1, "hqdn3d=$hqdn3d" ];
  } else {
    push @video_filters, [ 30.1, "hqdn3d" ];
  }

  push @video_filters, [ 40.1, "harddup" ]
    unless exists $video->{harddup} && !$video->{harddup};

  push @video_filters, @{$video->{filters}} if $video->{filters};

  use sort "stable";
  @video_filters = sort { $a->[0] <=> $b->[0] } @video_filters;
  @video_filters = map { $_->[1] } @video_filters;
  my $video_filters = join ",", @video_filters;

  my @out_options = ();
  push @out_options, "-ofps", $video->{ofps} if $video->{ofps};
  # XXX additionnal options

  my $codec = $video->{codec};
  my @codec_options =
    $codec eq "x264" ? codec_options_x264($video, $log_fh) :
    $codec eq "xvid" ? codec_options_xvid($video, $log_fh) :
    die;

  my $output_file = $video->{_output_file_raw};

  my @dummy_audio = ref_or_str($video->{_dummy_audio});
  @cmd = ("mencoder", @cmd, @dummy_audio, @codec_options,
    "-vf", $video_filters, "-of", "rawvideo", "-o", "$output_file.tmp",
    "-noautoexpand", @out_options);
  my $pid = run_command undef, $log_fh, $log_fh, @cmd;
  return {
    children => [ $pid ],
    tmpfiles => [ $output_file ],
  };
}

sub video_encode_video_remux($$) {
  my ($args, $log_fh) = @_;
  my $video = $args->{video};
  my $input_file = $video->{_output_file_raw};
  my $output_file = $video->{_output_file};
  my ($output_fmt) = $output_file =~ /\.(\w+)$/ or die;
  my @cmd = ("ffmpeg", "-i", $input_file, "-vcodec", "copy",
    "-f", $output_fmt, "-y", "$output_file.tmp");
  my $pid = run_command undef, $log_fh, $log_fh, @cmd;
  return {
    children => [ $pid ],
    tmpfiles => [ $output_file ],
  };
}

# }}}

########################################################################{{{
# Audio encoding
###########################################################################

sub video_encode_audio($$$) {
  my ($args, $audio, $log_fh) = @_;

  my @src = ref_or_str($args->{src});
  my @cmd = (@src);
  my $quality = $audio->{quality};
  push @cmd, ref_or_str($audio->{options});
  my %identify = identify @cmd;
  push @cmd, "-ofps", $args->{video}->{ofps} if $args->{video}->{ofps};
  my $sample_rate = $identify{ID_AUDIO_RATE};
  my $channels = $identify{ID_AUDIO_NCH};

  my @audio_filters;
  if(my $volume = $audio->{volume}) {
    push @audio_filters, "volume=${volume}:1";
  }
  if($channels == 6) {
    # oggenc -r expects in the Vorbis order:   FL FC FR RL RR LF
    # mencoder -oac pcm outputs in WAVE order: FL FR FC LF RL RR
    # audio filters work in mplayer order:     FL FR RL RR FC LF
    # In the filter:
    # ch0 is FL, oggenc wants it as ch0, pcm thinks ch0 is FL, FL is ch0
    # ch1 is FR, oggenc wants it as ch2, pcm thinks ch2 is FC, FC is ch4
    # ch2 is RL, oggenc wants it as ch3, pcm thinks ch3 is LF, LF is ch5
    # ch3 is RR, oggenc wants it as ch4, pcm thinks ch4 is RL, RL is ch2
    # ch4 is FC, oggenc wants it as ch1, pcm thinks ch1 is FR, FR is ch1
    # ch5 is LF, oggenc wants it as ch5, pcm thinks ch5 is RR, RR is ch3
    push @audio_filters, "channels=6:6:".
      "0:0:"."1:4:"."2:5:"."3:2:"."4:1:"."5:3";
  }
  push @audio_filters, "format=s16le";
  my $audio_filters = join ",", @audio_filters;

  my $output_file = $audio->{_output_file};

  my @cmd_menc = ("mencoder", @cmd, "-ovc", "frameno", "-vc", "null",
    "-of", "rawaudio", "-oac", "pcm", "-af", $audio_filters, "-o", "/dev/fd/|");
  my @cmd_oggenc = ("oggenc", "-Q", "-q", $quality, "-r", "-C", $channels,
    "-R", $sample_rate, "-o", "$output_file.tmp", "-");
  my @pid = run_pipeline undef, $log_fh, $log_fh, \@cmd_menc, \@cmd_oggenc;
  return {
    children => \@pid,
    tmpfiles => [ $output_file ],
  };
}

# }}}

########################################################################{{{
# Subtitles encoding
###########################################################################

sub video_encode_subtitles($$$) {
  my ($args, $sub, $log_fh) = @_;

  my @src = ref_or_str($args->{src});
  my @cmd = (@src);
  push @cmd, ref_or_str($sub->{options});
  push @cmd, ref_or_str($args->{video}->{_dummy_audio});

  my $output_prefix = $sub->{_output_file_idx};
  $output_prefix =~ s/\.\w+$// or die;

  my @cmd_menc = ("mencoder", @cmd, "-ovc", "frameno", "-vc", "null",
    "-o", "/dev/null", "-vobsubout", $output_prefix);
  my $pid = run_command undef, $log_fh, $log_fh, @cmd_menc;
  return {
    children => [ $pid ],
    # XXX atomically rename sub and idx
  };
}

# }}}

########################################################################{{{
# Merging
###########################################################################

sub video_write_chapters($$) {
  my ($file, $chapters) = @_;
  open my $chfh, ">:utf8", $file or die "$file: $!\n";
  print $chfh "<?xml version=\"1.0\"?>\n";
  print $chfh "<!DOCTYPE Chapters SYSTEM \"matroskatags.dtd\">\n";
  print $chfh "<Chapters>\n";
  print $chfh "  <EditionEntry>\n";
  for my $c (@$chapters) {
    my ($n, $cs, $ce) = @$c;
    for ($cs, $ce) {
      $_ = sprintf "%02d:%02d:%02d.%03d", int($_ / 3600), int($_ / 60) % 60,
	int($_) % 60, int($_ * 1000) % 1000 if defined $_;
    }
    print $chfh "    <ChapterAtom>\n";
    print $chfh "      <ChapterTimeStart>$cs</ChapterTimeStart>\n";
    print $chfh "      <ChapterTimeEnd>  $ce  </ChapterTimeEnd>\n" if $ce;
    if($n) {
      print $chfh "      <ChapterDisplay>\n";
      print $chfh "        <ChapterString>$n</ChapterString>\n";
      print $chfh "      </ChapterDisplay>\n";
    }
    print $chfh "    </ChapterAtom>\n";
  }
  print $chfh "  </EditionEntry>\n";
  print $chfh "</Chapters>\n";
}

sub video_encode_chapters($) {
  my ($args) = @_;
  my $chapters = $args->{chapters};
  return undef unless defined $chapters;
  my @chapters;
  if($chapters eq "auto") {
    # XXX use dvdxchap
    my @cmd = ref_or_str($args->{src});
    my %identify = identify @cmd;
    my $chp = $identify{CHAPTERS} or die "Unable to parse chapters.\n";
    for my $c (split ",", $chp) {
      push @chapters, [ "", $c ];
    }
  } elsif(ref $chapters) {
    @chapters = @$chapters;
  } else {
    return $chapters;
  }
  for my $c (@chapters) {
    my $a = 0;
    while($c->[1] =~ s/^(\d+)://) {
      $a = ($a + $1) * 60;
    }
    $c->[1] += $a;
  }
  my $chfile = $args->{tmp} . "chapters.xml";
  video_write_chapters $chfile, \@chapters;
  return $chfile;
}

sub video_merge($$) {
  my ($args, $log_fh) = @_;
  my $video = $args->{video};

  my $output_file = $args->{out};
  my @cmd = ("mkvmerge", "-o", "$output_file.tmp");

  push @cmd, "--title", $args->{title} if $args->{title};

  if(my $chapters = video_encode_chapters $args) {
    push @cmd, "--chapters", $chapters;
  }
  # XXX
  #if(my $dsize = $video->{dsize}) {
  #  push @cmd, "--display-dimensions", "0:$dsize";
  #}

  push @cmd, "--default-duration", "0:" . $video->{ofps} . "fps"
    if $video->{ofps};
  push @cmd, $video->{_output_file};

  for my $a (@{$args->{audio}}) {
    my $lang = $a->{lang};
    push @cmd, "--language", "0:$lang", $a->{_output_file};
  }

  for my $s (@{$args->{subtitles}}) {
    my $lang = $s->{lang};
    my $file = $s->{file} || $s->{_output_file_idx};
    push @cmd, "--language", "0:$lang", $file;
  }

  my $pid = run_command undef, $log_fh, $log_fh, @cmd;
  return {
    children_ignore => [ $pid ],
    tmpfiles => [ $output_file ]
  };
}

# }}}

########################################################################{{{
# Tasks preparation
###########################################################################

sub video(%) {
  my %args = @_;

  my $output = $args{out};
  my $video = $args{video};
  my @audio = @{$args{audio}};
  my @subtitles = @{$args{subtitles} || []};
  my @fdepends;
  my @tdepends;

  my $tmp = $args{tmp};
  $tmp = $args{tmp} = "tmp-" unless defined $tmp;
  create_parent_dirs $tmp;

  $video->{codec} = "x264" unless exists $video->{codec};
  my ($video_format, $video_rawext, $video_ext) =
    $video->{codec} eq "x264" ? ("raw", "h264", "h264") :
    $video->{codec} eq "xvid" ? ("avi", "m4v", "avi") :
    die "Unknown video codec.\n";
  $video->{_output_file} = "${tmp}video.$video_ext";
  $video->{_output_file_raw} = "${tmp}video.$video_rawext";
  push @fdepends, $video->{_output_file};

  for my $a (@audio) {
    my $lang = $a->{lang};
    $a->{options} = [ "-alang", $lang ] unless exists $a->{options};
    $video->{_dummy_audio} = [ ref_or_str($a->{options}), "-oac", "pcm" ]
      unless exists $video->{_dummy_audio};
    $a->{_output_file} = "${tmp}audio-$lang.ogg";
    push @fdepends, $a->{_output_file};
  }
  $video->{_dummy_audio} = [ "-nosound" ] unless exists $video->{_dummy_audio};

  for my $s (@subtitles) {
    my $lang = $s->{lang};
    if(my $file = $s->{file}) {
      push @fdepends, $s->{file};
    } else {
      $s->{options} = [ "-slang", $lang ] unless exists $s->{options};
      $s->{_output_file_idx} = "${tmp}sub-$lang.idx";
      $s->{_output_file_sub} = "${tmp}sub-$lang.sub";
      push @fdepends, $s->{_output_file_idx}, $s->{_output_file_sub};
    }
  }

  my $task_video = {
    name => "video $output",
    need_tokens => [ "cpu" ],
    need_tasks => [ ],
    input_files => [ ],
    output_files => [ $video->{_output_file_raw} ],
    run => sub { video_encode_video \%args, $_[0] },
    progress_parse => \&parse_mencoder,
  };
  task_add $task_video;
  push @tdepends, $task_video;

  if($video_format ne "raw") {
    my $task_video_remux = {
      name => "vremux $output",
      need_tokens => [ "cpu", "io" ],
      need_tasks => [ $task_video ],
      input_files => [ $video->{_output_file_raw} ],
      output_files => [ $video->{_output_file} ],
      run => sub { video_encode_video_remux \%args, $_[0] },
      progress_parse => \&parse_ffmpeg,
    };
    task_add $task_video_remux;
    push @tdepends, $task_video_remux;
  }

  for my $a (@audio) {
    my $lang = $a->{lang};
    my $task = {
      name => "audio $lang $output",
      need_tokens => [ "cpu" ],
      need_tasks => [ ],
      input_files => [ ],
      output_files => [ $a->{_output_file} ],
      run => sub { video_encode_audio \%args, $a, $_[0] },
      progress_parse => \&parse_mencoder,
    };
    task_add $task;
    push @tdepends, $task;
  }

  for my $s (@subtitles) {
    next if $s->{file};
    my $lang = $s->{lang};
    my $task = {
      name => "sub $lang $output",
      need_tokens => [ "cpu", "io" ],
      need_tasks => [ ],
      input_files => [ ],
      output_files => [ $s->{_output_file_idx}, $s->{_output_file_sub} ],
      run => sub { video_encode_subtitles \%args, $s, $_[0] },
      progress_parse => \&parse_mencoder,
    };
    task_add $task;
    push @tdepends, $task;
  }

  task_add {
    name => "merge $output",
    need_tokens => [ "cpu", "io" ],
    need_tasks => \@tdepends,
    input_files => \@fdepends,
    output_files => [ $output ],
    run => sub { video_merge \%args, $_[0] },
    progress_parse => \&parse_mkvmerge,
  };

}

# }}}

########################################################################{{{
# Useful functions
###########################################################################

sub mkchap($$) {
  my ($cht, $ch) = @_;
  my @chapters;
  my $t1;
  my $n;
  for my $i (0 .. $#$ch) {
    my $t2 = $ch->[$i];
    next unless defined $t2 && $t2 =~ /\d/;
    push @chapters, [ $n, $t1, $t2 ] if defined $t1;
    $t1 = $t2;
    $n = $cht->[$i];
  }
  return \@chapters;
}

sub text_to_filename($) {
  my ($text) = @_;
  $text = NFKD($text);
  $text =~ s/\pM//g;

  $text =~ s/\x{0153}/oe/g;
  $text =~ s/\x{20AC}/EUR/g;

  $text =~ s/[^\w-]/_/g;
  $text =~ s/__+/_/g;
  $text =~ s/^_+//;
  $text =~ s/_+$//;

  die "Unconvertible characters: U+", sprintf("%04X", ord $1)
    if $text =~ /([^A-Za-z0-9_-])/;
  return $text;
}

# }}}

1
