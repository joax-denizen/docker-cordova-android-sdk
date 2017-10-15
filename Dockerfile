FROM beevelop/cordova:latest

RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y lib32stdc++6 lib32z1 nodejs git tar bzip2 python build-essential

RUN npm -v

# Latest NPM Node
# RUN npm install -g npm@latest
RUN npm cache clean --force

# download and extract android sdk
RUN curl http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar xz -C /usr/local/
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# update and accept licences
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/android-sdk-linux/tools/android update sdk --no-ui -a --filter platform-tool,build-tools-25.0.2,build-tools-26.0.1,android-25,android-26; \
    find /usr/local/android-sdk-linux -perm 0744 | xargs chmod 755

# Install Gulp and Cordova
RUN npm install -g gulp@latest

ENV GRADLE_USER_HOME /src/gradle
VOLUME /src
WORKDIR /src
