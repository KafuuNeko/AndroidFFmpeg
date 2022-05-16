#!/bin/bash
# 当前系统
export HOST_TAG=linux-x86_64

# NDK 根目录
export NDK=/bin/tools/android-ndk-r23b/

# 支持的 Android 最低系统版本
export MIN=21
export ANDROID_NDK_PLATFORM=android-21

export MIN_PLATFORM=$NDK/platforms/android-$MIN
export SYSROOT=$NDK/sysroot
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG
export AR=$TOOLCHAIN/bin/arm-linux-androideabi-ar
export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as

export LD=$TOOLCHAIN/bin/arm-linux-androideabi-ld
export NM=$TOOLCHAIN/bin/arm-linux-androideabi-nm
export RANLIB=$TOOLCHAIN/bin/arm-linux-androideabi-ranlib
export STRIP=$TOOLCHAIN/bin/arm-linux-androideabi-strip

# 支持的 Android CUP 架构

# armv7a
# export ARCH=armv7a
# export CPU=arm-v7a
# export CC=$TOOLCHAIN/bin/$ARCH-linux-androideabi$MIN-clang
# export CXX=$TOOLCHAIN/bin/$ARCH-linux-androideabi$MIN-clang++

# arm64
# export ARCH=aarch64
# export CPU=arm64
# export CC=$TOOLCHAIN/bin/aarch64-linux-android$MIN-clang
# export CXX=$TOOLCHAIN/bin/aarch64-linux-android$MIN-clang++

# export ARCH=x86_64
# export CPU=x86_64
# export CC=$TOOLCHAIN/bin/x86_64-linux-android$MIN-clang
# export CXX=$TOOLCHAIN/bin/x86_64-linux-android$MIN-clang++

export ARCH=i686
export CPU=i686
export CC=$TOOLCHAIN/bin/i686-linux-android$MIN-clang
export CXX=$TOOLCHAIN/bin/i686-linux-android$MIN-clang++

# 生成库的目录
export PREFIX=$(pwd)/android/$CPU

./configure \
    --prefix=$PREFIX \
    --ar=$AR \
    --as=$AS \
    --cc=$CC \
    --cxx=$CXX \
    --ranlib=$RANLIB \
    --strip=$STRIP \
    --arch=$ARCH \
    --target-os=android \
    --enable-cross-compile \
    --enable-shared \
    --disable-asm \
    --disable-static \
    --disable-ffprobe \
    --disable-ffplay \
    --disable-ffmpeg \
    --disable-debug \
    --disable-symver \
    --disable-stripping \
    --enable-decoder=h264 \
    --enable-decoder=aac \
    --enable-demuxer=mov \
    --enable-demuxer=flv \
    --enable-demuxer=rtsp \
    --enable-demuxer=mp3 \
    --enable-demuxer=h264 \
    --enable-demuxer=aac \
    --enable-muxer=mp4 \
    --enable-muxer=flv \
    --enable-muxer=h264 \
    --enable-muxer=adts \
    --enable-muxer=mp3 \

