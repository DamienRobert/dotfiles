vim: ft=markdownlight

* Algorithms:
http://ethw.org/History_of_Lossless_Data_Compression_Algorithms
- LZ77: https://en.wikipedia.org/wiki/LZ77_and_LZ78#LZ77
- LZW: https://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Welch,
  improvement of LZ78
  => Used by 'compress' and gif files
- DEFLATE: https://en.wikipedia.org/wiki/DEFLATE
  LZ77 algorithm and Huffman coding
  => gzip, zip, zopfli, PNG
- Zstandard: https://en.wikipedia.org/wiki/Zstandard
  LZ77 + entropy coding (by Facebook)
  => zstd Cf https://github.com/facebook/zstd/releases/tag/v1.3.4
  Other similar approaches: brotli (google), lzfse (apple)
- LZMA: https://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Markov_chain_algorithm
  Based on LZ77, strong compression
  => xz and 7z
- https://en.wikipedia.org/wiki/LZ4_(compression_algorithm)
  Based on LZ77, fast compression/decompression
- http://mattmahoney.net/dc/zpaq.html

* Softwares:
- gzip, bzip [parrallel: pbzip, lbzip (even faster)]
- Slow but good compression => lzma: xz, 7z
- Intermediate: zstandard (facebook) => as good compression as zlib, but
  much faster
  zstd (3x faster than gzip for the same compression; energy efficient)
  Voir aussi brotli (google), globalement moins bon que zstd
- Fast compression/decompresion: lzo, lz4
- Large files: lrzip (which use lzma by default, zpaq is even better but much more slow)

+ lrzip: https://wiki.archlinux.org/index.php/Lrzip (for large files)
-> http://www.techradar.com/news/software/applications/best-linux-compression-tool-8-utilities-tested-933098/2
   http://gcc.gnu.org/ml/gcc/2012-03/msg00549.html
   http://a3nm.net/blog/images_lrzip.html
   http://ck.kolivas.org/apps/lrzip/README.benchmarks

+ Block compression for seeking: bgzf, dictzip
  http://blastedbio.blogspot.fr/2011/11/bgzf-blocked-bigger-better-gzip.html
  http://stackoverflow.com/questions/429987/compression-formats-with-good-support-for-random-access-within-archives

+ zstandard:
  http://fastcompression.blogspot.fr/2015/01/zstd-stronger-compression-algorithm.html
  https://code.facebook.com/posts/1658392934479273/smaller-and-faster-data-compression-with-zstandard/

+ lzip:
  https://www.nongnu.org/lzip/xz_inadequate.html

* Benchmarks
https://community.centminmod.com/threads/round-4-compression-comparison-benchmarks-zstd-vs-brotli-vs-pigz-vs-bzip2-vs-xz-etc.18669/
