FROM ubuntu:15.04
MAINTAINER Geoff Taylor <hub.docker.com@opinionatedgeek.com>
RUN apt-get update && apt-get -yq upgrade
RUN apt-get -yq install wget xutils-dev make automake vim

ENV ANDROID_NDK_VERSION android-ndk-r10e
ENV ANDROID_API_VERSION android-21
ENV ANDROID_TOOLCHAIN_VERSION arm-linux-androideabi-4.9
ENV ANDROID_API $ANDROID_API_VERSION
ENV ANDROID_NDK /$ANDROID_NDK_VERSION
ENV ANDROID_NDK_ROOT /$ANDROID_NDK_VERSION
ENV TOOLCHAIN_BIN /$ANDROID_NDK_VERSION/toolchains/$ANDROID_TOOLCHAIN_VERSION/prebuilt/linux-x86_64/bin
ENV CC $TOOLCHAIN_BIN/arm-linux-androideabi-gcc
ENV CXX $TOOLCHAIN_BIN/arm-linux-androideabi-g++
ENV LD $TOOLCHAIN_BIN/arm-linux-androideabi-ld
ENV AR $TOOLCHAIN_BIN/arm-linux-androideabi-ar
ENV RANLIB $TOOLCHAIN_BIN/arm-linux-androideabi-ranlib
ENV STRIP $TOOLCHAIN_BIN/arm-linux-androideabi-strip
ENV SYSROOT /$ANDROID_NDK_VERSION/platforms/$ANDROID_API_VERSION/arch-arm/
ENV CFLAGS --sysroot=$SYSROOT
ENV CXXFLAGS --sysroot=$SYSROOT
ENV CPPFLAGS --sysroot=$SYSROOT
ENV LDFLAG --sysroot=$SYSROOT
ENV PATH $PATH:$ANDROID_NDK_ROOT:$ANDROID_NDK_ROOT/toolchains:$TOOLCHAIN_BIN

RUN wget http://dl.google.com/android/ndk/$ANDROID_NDK_VERSION-linux-x86_64.bin
RUN chmod a+x $ANDROID_NDK_VERSION-linux-x86_64.bin
RUN ./$ANDROID_NDK_VERSION-linux-x86_64.bin

RUN mkdir /src
WORKDIR /src
