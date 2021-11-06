# README

"Kondo" is a image catalog application, think about it like lightroom cc meet google photo. The basic need came when google photos "free" tier was removed. However this is not designed to be an application where you can register and upload your photos. The idea is that you are the owner of your catalog of pictures, you can upload your pictures and you can also share your pictures with selected people. 

Of course the name is inspired on Marie Kondo method, I found that I have a multi year unorganized catalog that I need to organize it and figure it out what brings joy to me. 

The planned functionalities are ;
- albums
- auto auto album insertion
- catalog organizing (move files around)
- dupes detection and cleanup
- face detection
- raw support
- multi-sources support 
- backup capabilities

Due to the "face detection" I'm planning we will need something that can run face detection algorithms on a "decent" time, that means this software is mean to be run on nvidia gpu, including the Jetson. 

The intial approach was with docker, however, a lot of the open source software is not prepared to run this way, on the new approach we will abstract the face detection from the main rails app with Kafka, that means that this project will grow into a multi lenguage approach.

This is meant to be the main repo, but as long as we can mantaina standard for face recognition it will be interchangable.



# old readme 

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

# on nvidia;

first try;
https://github.com/ageitgey/face_recognition

https://github.com/mdegans/nano_build_opencv
https://medium.com/@ageitgey/build-a-hardware-based-face-recognition-system-for-150-with-the-nvidia-jetson-nano-and-python-a25cb8c891fd

dlib issues, basically downlad latest 19.22
https://forums.developer.nvidia.com/t/issues-with-dlib-library/72600/16
https://forums.developer.nvidia.com/t/how-to-build-dlib-in-jetson-nano-in-deepstream-l4t-container/144536/8

## Docker

### Production

- Run `docker build . -t kondo -f Dockerfile.production` for a production ready image

### Development

- Run `docker-compose build` everytime there is a Gemfile or yarn.lock change.
- Run `docker-compose up` to start environment
- Run `docker exec kondo_kondo_1 bundle exec rails db:prepare` to create or migrate db
