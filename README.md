# README

prerequesites;

sudo apt install imagemagick dcraw libvips42  libpq-dev

correct delegate:
/etc/ImageMagick-6/delegates.xml
replace this:
  \<delegate decode="dng:decode" command="&quot;ufraw-batch&quot; --silent --create-id=also --out-type=png --out-depth=16 &quot;--output=%u.png&quot; &quot;%i&quot;"/>
with this:  
\<delegate decode="dng:decode" command="&quot;dcraw&quot; -c &quot;%i&quot; &gt; &quot;%u.ppm&quot;" />
\<delegate decode="dng:decode" command="&quot;dcraw&quot; -c -q 3 -w &quot;%i&quot; &gt; &quot;%u.ppm&quot;" />

<https://stackoverflow.com/questions/52322701/imagemagick-raw-file-identify-convert-no-such-file-or-directory-tmp-file>

## Docker

### Production

- Run `docker build . -t kondo -f Dockerfile.production` for a production ready image

### Development

- Run `docker-compose build` everytime there is a Gemfile or yarn.lock change.
- Run `docker-compose up` to start environment
- Run `docker exec kondo_kondo_1 bundle exec rails db:prepare` to create or migrate db
