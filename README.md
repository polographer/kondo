# README

prerequesites;

sudo apt install imagemagick dcraw libvips42  libpq-dev

correct delegate:
/etc/ImageMagick-6/delegates.xml
replace this:
  <delegate decode="dng:decode" command="&quot;ufraw-batch&quot; --silent --create-id=also --out-type=png --out-depth=16 &quot;--output=%u.png&quot; &quot;%i&quot;"/>
with this:  
<delegate decode="dng:decode" command="&quot;dcraw&quot; -c &quot;%i&quot; &gt; &quot;%u.ppm&quot;" />
<delegate decode="dng:decode" command="&quot;dcraw&quot; -c -q 3 -w &quot;%i&quot; &gt; &quot;%u.ppm&quot;" />

https://stackoverflow.com/questions/52322701/imagemagick-raw-file-identify-convert-no-such-file-or-directory-tmp-file


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
