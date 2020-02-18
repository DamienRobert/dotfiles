vim: ft=markdownlight fdm=expr

Encoding
========
[see also the script tox265 and ~/script/extra/ffmpeg]

* Standard:
ffmpeg -i foo -avoid_negative_ts 0 -c:v libx265 -preset:v veryslow -crf 28 -c:a libopus -b:a 96000 [-vf hqdn3d] foo.mkv

* Encode dvd like + vorbis: [yadif: means "yet another deinterlacing filter]
ffmpeg -i orig.mpg -c:v libx264 -preset veryslow -crf 20 -vf yadif,scale=512:384,hqdn3d -c:a libvorbis -q:a 3  out.mkv

* Blue ray like (audio: aac):
ffmpeg -i foo -c:v libx264 -preset:v veryslow -tune:v film -crf 25 -c:a aac -strict -2 -q:a 4 -vf hqdn3d foo.mp4
  #-strict -2 because aac is 'experimental'

* Mp3:
ffmpeg -i foo -c:v libx265 -preset:v veryslow -x265-params crf=28 -c:a libmp3lame -q:a 6 -vf hqdn3d foo.avi

* Two Pass:
  ffmpeg -i input -pass 1 -c:v libx264 -preset fast -b 512k \
    -f mp4 -an -y /dev/null && ffmpeg -i input -pass 2 -c:v libx264 \
    -preset fast -b 512k 0 -c:a libfaac -b:a 128k -ac 2 output.mp4

* Options:
-vcodec alias for -codec:v (shortcut -c:v); same for -acodec = -c:a
-vf video filter
-b:a audio bitrate
-an disable audio, -vn disable video, -sn disable subtitle
-y: overwrite output file without asking
-f format (usually autodetected from the extension)
-avoid_negative_ts is on by default but this can be harmful, desactivate.
-vf: alias for -format:v

Specific Codec options: '-x264opts frameref=15:fast_pskip=0' (from archwiki)

Seeking: -ss 00:23:00, -t/-to 00:24:00
Eg to copy a certain part: ffmpeg -i foo -to 1:00:00 foo_shortcut

Stream selection
-----------------

https://ffmpeg.org/ffmpeg.html

In the absence of any map options for a particular output file, ffmpeg inspects the output format to check which type of streams can be included in it, viz. video, audio and/or subtitles. For each acceptable stream type, ffmpeg will pick one stream, when available, from among all the inputs.

It will select that stream based upon the following criteria:
  - for video, it is the stream with the highest resolution,
  - for audio, it is the stream with the most channels,
  - for subtitles, it is the first subtitle stream found but there’s a caveat. The output format’s default subtitle encoder can be either text-based or image-based, and only a subtitle stream of the same type will be chosen. 

Map: -map 0 to ensure that all streams are copied.
     https://ffmpeg.org/ffmpeg.html#Advanced-options
     -map 0:1 -map 1:2 -> select 2nd stream from first input and 3th stream from second input
     -map 0:v -> select all video streams
     -map 0:a:1 -> select second audio stream

Ex: `ffmpeg -i INPUT -map 0:m:language:eng OUTPUT` to pick the english
audio stream.

Stream specifier: -codec:a:1 ac3 = second audio stream
                  -b:a 128k => all audio streams

Metadata (voir aussi -map-metadata):
For example, for setting the title in the output file:
$ ffmpeg -i in.avi -metadata title="my title" out.flv

$ To set the language of the first audio stream:
ffmpeg -i INPUT -metadata:s:a:0 language=eng OUTPUT
[:s: pour dire que c'est une metadata pour le steram]

Subtitles
---------

Subtitles options: -scodec copy/-codec:s copy/-c:s copy pour copier les sous-titres, -sn pour les enlever (In case of encoding problems due to transcoding subtitles), -s 380x288 pour réduire la taille
Cf https://askubuntu.com/questions/214199/how-do-i-add-and-or-keep-subtitles-when-converting-video to add metadata for subtitles.

https://en.wikibooks.org/wiki/FFMPEG_An_Intermediate_Guide/subtitle_options
Eg for mkv '-scodec ass', for .mov/.mp4 '-scodec mov_text'

$ ffmpeg -i input.mkv [-sub_charenc CP1252] -i subtitle.srt -map 0:v -map 0:a -c copy -map 1 -c:s:0 srt -metadata:s:s:0 language=fre output.mkv

$ ffmpeg -i input.mp4       -i subtitle_eng.srt -i subtitle_fre.srt \
       -map 0:v -map 0:a  -map 1              -map 2              \
       -c:v copy -c:a copy -c:s copy                              \
       -metadata:s:s:0 language=eng -metadata:s:s:1 language=fre  \
  output.mkv

https://trac.ffmpeg.org/wiki/HowToBurnSubtitlesIntoVideo
=> burn text subtitles (hardsubs)

Exemple:
$ ffmpeg -i C.mkv out1.mkv -c:s dvdsub -an out2.mkv

Although out1.mkv is a Matroska container file which accepts subtitle
streams, only a video and audio stream shall be selected. The subtitle
stream of C.mkv is image-based and the default subtitle encoder of the
Matroska muxer is text-based, so a transcode operation for the subtitles is
expected to fail and hence the stream isn’t selected. However, in out2.mkv,
a subtitle encoder is specified in the command and so, the subtitle stream
is selected, in addition to the video stream. The presence of -an disables
audio stream selection for out2.mkv. 

-> -c:s copy => to copy dvdsub
-> -c:s dvdsub => to reencode dvdsub (par exemple -canvas_size 704x576 to set the subtitle resolution)

Codecs
------

ffmpeg -formats [=-demuxers/-muxers]
ffmpeg -codecs [=-decoders/-encoders]

ffprobe file (show codecs in a file, usefull to know if we convert the audio or just copy it for instance)
fmpeg -analyzeduration 100M -probesize 100M -i input.vob

-> for better compatibility: use avi+x26?+mp3/aac or mp4+x26?+aac 
  (warning: with 'avi' its better to use mp3 than vorbis)

Audio codecs: https://trac.ffmpeg.org/wiki/Encode/HighQualityAudio
  libfdk_aac > libmp3lame > libfaac
  So mp3 (libmp3lame) is better than aac unless ffmpeg has libfdk_aac

AV1
---

https://www.singhkays.com/blog/its-time-replace-gifs-with-av1-video/
ffmpeg.exe -i input.mp4 -pix_fmt yuv420p -movflags faststart -c:v libaom-av1 -b:v 200k -filter:v scale=720:-1 -strict experimental -cpu-used 1 -tile-columns 2 -row-mt 1 -threads 8 -pass 2 output.mp4

Note: yuv420p is a pixel format which is the most compatible for encoding
cf https://trac.ffmpeg.org/wiki/Encode/H.264

Audio
-----

-aq alias for -q:a (audio quality)
-ac: number of audio channels

Delay audio: https://wjwoodrow.wordpress.com/2013/02/04/correcting-for-audiovideo-sync-issues-with-the-ffmpeg-programs-itsoffset-switch/
  ffmpeg -i foo.avi -itsoffset -2.0 -i foo.avi -c:v copy -c:a copy -map 0:0 -map 1:1 foo-delay.avi

-> find audio delay with mpv: Ctrl +/Ctrl - and run:
FILE=foo; ffmpeg -i $FILE.mkv -itsoffset 0.8 -i $FILE.mkv -c:v copy -c:a copy -map 0:0 -map 1:1 $FILE-delay.mkv

- Very low opus bitrate:
  ffmpeg -i 20150913_211742_0476879397.wav -c:a libopus -b:a 8000 20150913_211742_0476879397.opus

- Encode flv audio into mp3:
  for file in *; do tox265 -a -acodec mp3 -aq 2 -ext mp3 $file; done
  (-aq 2 is for 192kb/s, by default tox265 -acode mp3 uses 128kb/s,
  see https://trac.ffmpeg.org/wiki/Encode/MP3)

  Calling ffmpeg directly:
  ffmpeg -i $file -vn -c:a libmp3lame -q:a 1 $file.mp3

- Extract audio
  ffmpeg -i input-video.avi -vn -acodec copy output-audio.aac

Add audio to an image
  ffmpeg -loop 1 -i image.jpg -i audio.wav -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest out.mp4
  [-shortest: Finish encoding when the shortest input stream ends.]

Presets
-------

http://x265.readthedocs.org/en/latest/presets.html
ultrafast superfast veryfast faster fast medium slow slower veryslow placebo

-> tox265 -preset medium ...

Tuning
------

'-tune': film, animation, grain, stillimage, psnr, ssim, fastdecode, zerolatency, touhou
  For x265: psnr, ssim, grain, zerolatency, fastdecode

Tune options to further optimise them for your input content. If you specify a tuning, the changes will be applied after preset but before all other parameters.
- film: Optimize for film content: deblock -1:-1, psy-rd 1:0.15
- animation: Optimize for animated content: ref (double default reference count if greater than 1), deblock 1:1, psy-rd 0.4:0, aq-strength 0.6, bframes (add 2 bframes to the default)
- grain: Optimize for grainy content: deblock -2:-2, psy-rd 1:0.25, no-dct-decimate, ipratio 1.1, pbratio 1.1, aq-strength 0.5, deadzone-intra 6, deadzone-inter 6, qcomp 0.8
- psnr: Optimize for PSNR: aq-mode 0, no-psy  [benchmark]
- ssim: Optimize for SSIM: aq-mode 2, no-psy  [benchmark]
- fastdecode: Optimize for fast decoding of content: no-deblock, no-cabac, no-weightb
- touhou: Optimize for Touhou captures: ref (double default reference count if greater than 1), deblock -1:-1, psy-rd 1:0.2, aq-strength 1.3, partitions (add p4x4 if p8x8 is enabled)
- zerolatency: pas de latency, pour le streaming

Low Latency (pour le streaming)
-----------

--rc-lookahead 0
--sync-lookahead 0
--bframes 0 (if you can get away with 1 or 2, this will improve quality a lot, but each one adds one frame of latency)
--threads 1 (if you can get away with more this will improve speed a lot, but each one adds one frame of latency)
--sliced-threads
  Slice-based threading support, unlike normal threading, adds no encoding latency. Less efficient than normal threading, both performance and compression-wise.
  Useful for low-latency encoding environments where performance is still important, such as HD videoconferencing.
--tune zerolatency, which eliminates all x264 encoder-side latency (no delayed frames at all) + Some tweaks to VBV ratecontrol and lookahead (in addition to those required by sliced threading). [Commit sponsored by a media streaming company that wishes to remain anonymous.]

Crop detection
--------------

http://superuser.com/questions/772795/is-it-possible-to-autocrop-black-borders-of-a-video-with-ffmpeg
ffplay -i YourMovie.mp4 -vf "cropdetect=24:16:0"

cropdetect=limit:round:reset
limit = black threshold (default 24)
round = output resolution must be divisible to this
reset = after how many frames the detection process will start over

Exemples
========

Dvd
---

* Cigaes, yaf/osmic:9449 (encoder un dvd)
LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/x264-10bit \
  nice ffmpeg \
  -i
concat:'LE_PERIL_JEUNE_DVD_1_FILM1-1.vob|LE_PERIL_JEUNE_DVD_1_FILM1-2.vob|LE_PER
IL_JEUNE_DVD_1_FILM1-3.vob' \
  -vf yadif,scale=720:405,format=yuv444p10,crop=672:400:24:2,hqdn3d \
  -pix_fmt yuv444p10 -c:v libx264 -preset veryslow -tune film -crf 20 \
  -c:a libopus -b:a 96k -ac 2 \
  -map '0:v' -map '0:#0x80' -avoid_negative_ts 0 \
  -metadata:g title="Le péril jeune" \
  -metadata:s:0 language=fre \
  -metadata:s:1 language=fre \
  -y Le_peril_jeune.mkv

[yadif: deinterlace; -ac 2: only keep 2 audio output channel
 yuv444p10: https://en.wikipedia.org/wiki/YUV => dvd uses a MPEG-2 format, which uses a full Y′CbCr color space
 -avoid_negative_ts: Shift timestamps to make them positive, on by default
 on ffmpeg, -avoid_negative_ts 0 desactivate this
 ]

* Extraire un dvd:
https://wiki.archlinux.org/index.php/Dvdbackup

- sudo dvdbackup -i /dev/sr0 -M -o . #-M: mirror
~/usr/other/scripts/dvd2concat Hommage\ A\ Jerome\ Robbins > concat.txt
=> ffplay -f concat -safe 0 -i concat.txt

- mpv --stream-dump=dvd.mpeg  dvd://2
=> ffplay dvd.mpeg

- dvdxchap -t 2 Hommage_A_Jerome_Robbins > dvd.chapters

ffplay -vf "yadif,scale=853x480,format=yuv444p10,hqdn3d,cropdetect=24:16:0" sample.mpeg

ffmpeg -i dvd.mpeg \
  -vf yadif,scale=853x480,format=yuv444p10,hqdn3d,crop=848:480:2:0 \
  -pix_fmt yuv444p10 -c:v libx265 -preset veryslow -crf 28 \
  -c:a libopus -b:a 128k  \
  -map 0:v -map 0:1 \
  -avoid_negative_ts 0 \
  -metadata:g title="Hommage A Jerome Robbins" \
  -y hommage_jerome_robbins.mkv

mkvmerge hommage_jerome_robbins.mkv --chapters dvd/dvd.chapters -o hommage_jerome_robbins-chapters.mkv

Video from images
-----------------

* concatenate images to make a video:
ffmpeg -f image2 -pattern_type glob -framerate 3 -i '*.JPG' gopro3.mkv

* Repeat stream: https://video.stackexchange.com/questions/12905/repeat-loop-input-video-with-ffmpeg
ffmpeg -stream_loop -1 -i input.mp4 -c copy -fflags +genpts output.mp4
  -1: repeat infinity
  genpts: Generate missing PTS if DTS is present. 

Complex filters
---------------

Cf the thread https://twitter.com/gro_tsen/status/1174246336973197312
https://gist.github.com/Gro-Tsen/c5d0274e3139e570c7b0992ea42cbe32
