# README

# packages needed on the image (ubuntu)

sudo apt install imagemagick dcraw libvips42  libpq-dev libexif-dev libimage-exiftool-perl

# Image magick configuration for raw thumbanails

correct delegate:
/etc/ImageMagick-6/delegates.xml
replace this:
  <delegate decode="dng:decode" command="&quot;ufraw-batch&quot; --silent --create-id=also --out-type=png --out-depth=16 &quot;--output=%u.png&quot; &quot;%i&quot;"/>
with this (check the -q3, gives more accurate colors):
<delegate decode="dng:decode" command="&quot;dcraw&quot; -c -q 3 -w &quot;%i&quot; &gt; &quot;%u.ppm&quot;" />

This was the other default for raw:
<delegate decode="dng:decode" command="&quot;dcraw&quot; -c &quot;%i&quot; &gt; &quot;%u.ppm&quot;" />

https://stackoverflow.com/questions/52322701/imagemagick-raw-file-identify-convert-no-such-file-or-directory-tmp-file


