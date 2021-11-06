# README

"Kondo" is an image catalog application, think about it like lightroom cc meet google photo. The basic need came when google photos "free" tier was removed. However, this is not designed to be an application where you can register and upload your photos. The idea is that you are the owner of your catalog of pictures, you can upload your pictures and you can also share your pictures with selected people. 

Of course, the name is inspired by Marie Kondo method, I found that I have a multi-year unorganized catalog of pictures that I need to organize and figure out what brings joy to me. 

The planned functionalities are ;
- albums
- auto album insertion
- catalog organizing (move files around)
- dupes detection and cleanup
- face detection
- face recognition 
- raw support
- multi-sources support 
- backup capabilities

Due to the "face detection" I'm planning we will need something that can run face detection algorithms at a "decent" time, which means this software is meant to be run on NVidia GPU, including the Jetson. 

The idea is going to be to send a message via a "queue" and it will be picked up by software capable of doing face detection. 

The initial approach was with docker, however, a lot of the open-source software is not prepared to run this way (the jetson needs a lot of "band-aids" to enable face detection, on the new approach we will abstract the face detection from the main rails app with Kafka or RabbitMQ, which means that this project will grow into a multi-language approach. And the face detection app may be written on phyton (I know it's horrible, but the bindings are already there).

I want to re-invent the wheel neither create a new way to interact with Nvidia CUDA, I only want the software to work so expect a lot of pieces running at the same time in different languages.

This is meant to be the main repo, but as long as we can maintain a standard for face recognition it will be interchangeable.

# ------- old readme ------ will be moved to the wiki ...

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
