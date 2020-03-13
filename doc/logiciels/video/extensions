vim: ft=markdownlight

See also =tox264 for some default options of ffmpeg

Containers:
===========

* http://en.wikipedia.org/wiki/Digital_container_format

Other flexible containers can hold many types of audio and video, as well as other media. The most popular multi-media containers are:
- 3GP (used by many mobile phones; based on the ISO base media file format)
- ASF (container for Microsoft WMA and WMV, which today usually do not use a container)
- AVI (the standard Microsoft Windows container, also based on RIFF)
- DVR-MS ("Microsoft Digital Video Recording", proprietary video container format developed by Microsoft based on ASF)
- Flash Video (FLV, F4V) (container for video and audio from Adobe Systems)
- IFF (first platform-independent container format)
- Matroska (MKV) (not limited to any codec or system, as it can hold virtually anything. It is an open standard and open source container format).
- MJ2 - Motion JPEG 2000 file format, based on the ISO base media file format which is defined in MPEG-4 Part 12 and JPEG 2000 Part 12
- QuickTime File Format (standard QuickTime video container from Apple Inc.)
- MPEG program stream (standard container for MPEG-1 and MPEG-2 elementary streams on reasonably reliable media such as disks; used also on DVD-Video discs)
- MPEG-2 transport stream (a.k.a. MPEG-TS) (standard container for digital broadcasting and for transportation over unreliable media; used also on Blu-ray Disc video; typically contains multiple video and audio streams, and an electronic program guide)
- MP4 (standard audio and video container for the MPEG-4 multimedia portfolio, based on the ISO base media file format defined in MPEG-4 Part 12 and JPEG 2000 Part 12) which in turn was based on the QuickTime file format.
  Note: M4V file extension is an MPEG-4 Video file.
        mp4, m4a and m4v are all similars (m4v is used by apple)
- Ogg (standard container for Xiph.org audio format Vorbis and video format Theora)
-> OGG / OGM is a container, Vorbis is a type of audio compression.
- RM (RealMedia; standard container for RealVideo and RealAudio)
- webm: (based on a subset of mkv)

* http://en.wikipedia.org/wiki/Comparison_of_container_formats

- mp4 is limited in video format (mainly mpeg4/h264) and audio format (mp3, ac3, vorbis(???))
- avi (virtually anything, but vorbis is problematic:
 Although FFmpeg has introduced a solution to put Vorbis audio into AVI files, this "extension" is not compatible with existing Vorbis decoders for DirectShow and ACM. Putting Vorbis in an AVI container is very problematic. The way Nandub stored Vorbis audio streams in AVI files occasionally caused desychronisation when seeking.)

- mp4 vs avi: http://www.macxdvd.com/mac-dvd-video-converter-how-to/mp4-vs-avi.htm
- mp4 vs mkv:
  MKV is more flexible - it is designed to accept virtually any video and audio compression CODECs, supports embedded subtitles in numerous formats, allows attached metadata such as chapter information, etc.
  MP4 is limited only to MPEG4 audio and video. In practice, this mean that you can use H264 video, and AAC audio only. DTS and AC3 audio CODECs are not officially supported, neither are MP3, etc. Some programs may allow you to create MP4 files with DTS/AC3 audio, and some programs/devices may even play them, but these files are not standards compliant and not guaranteed to be playable. MP4 also doesn't support metadata like chapters, etc.
- opus vs ogg: https://wiki.xiph.org/OpusFAQ#Will_Opus_replace_Vorbis_in_video_files.3F
  For OGG Theora video files, it can, just the overall size reduction will be minimal, and it will break compatibility with existing players.
  For WebM video files, the convention is to use the VP9 video codec when using Opus as an audio codec.

Video
======

- WebM is a video file format[3] intended primarily for royalty-free use in the HTML5 video tag. The WebM Project releases WebM-related software under a BSD license and all users are granted a worldwide, non-exclusive, no-charge, royalty-free patent license. The project is sponsored by Google Inc.
The WebM container is based on a profile of Matroska.[2][4][5] WebM initially supported VP8 video and Vorbis audio streams. In 2013 it was updated to accommodate VP9 video and Opus audio.[6][7]

https://www.webmproject.org/about/faq/
VP8/VP9 video and Vorbis/Opus audio are the only codecs allowed in a valid .webm file.

- webp: WebP is an image format employing both lossy[6] and lossless compression.

- av1: Futur codec: https://en.wikipedia.org/wiki/AOMedia_Video_1 (av1)
  Basé sur vp10+daala+thor

Audio
=====

- http://gamedev.stackexchange.com/questions/4100/difference-between-vorbis-ogg-and-m4a-mp4-aac
- http://superuser.com/questions/118212/what-is-mp4v-and-mp4a
  mp4=codec+container, mp4v=video codec, mp4a=audio codec
- codec2: http://www.rowetel.com/?page_id=452
  For very low bandwith voice recording
=> codec2 / opus / flac gives all the compression spectrum

Images
======

- webp basé sur vp8
- bpg (Better Portable Graphics) basé sur hevc (ie h265)
  heif: https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
- flif: lossless but more efficient than png
- avif: basé sur av1
  https://netflixtechblog.com/avif-for-next-generation-image-coding-b1d75675fe4
- flif: https://en.wikipedia.org/wiki/Free_Lossless_Image_Format
  http://flif.info/
- -> superseded by Jpeg-XL
