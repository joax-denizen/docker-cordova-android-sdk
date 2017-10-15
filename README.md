# docker-cordova-android-sdk
Docker to develop and build Android apps on Cordova. It includes:

* Cordova 5.1.1
* Android SDK 24.4.1
* SDK 25, 26
* Node
* Gulp

# Usage

To run cordova on the project just do the following:

$ docker run -it -v `pwd`:/src --workdir /src denizenio/docker-cordova-android-sdk:latest

This will set the source in the container with the right libraries:

$ cordova prepare

$ cordova build android

# Docker Hub Image
https://hub.docker.com/r/denizenio/docker-cordova-android-sdk/
