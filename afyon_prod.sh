#!/bin/bash

OUT_DIR="$(pwd)/OUT"

rm -rf $OUT_DIR
mkdir -p $OUT_DIR/kernel
mkdir -p $OUT_DIR/modules
 
echo " Cleaning kernel (make mrproper)..."
make mrproper

make -j4 ARCH=arm CROSS_COMPILE=/home/josegalre/Android/cm-11.0/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin/arm-eabi- afyonlte_defconfig
make -j4 ARCH=arm CROSS_COMPILE=/home/josegalre/Android/cm-11.0/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin/arm-eabi-

echo " Copying kernel (zImage) to $OUT_DIR/kernel/..."
cp arch/arm/boot/zImage $OUT_DIR/kernel/

echo " Copying modules (*.ko) to $OUT_DIR/modules/..."
find . -name \*.ko -exec cp '{}' $OUT_DIR/modules/ ';'

echo " All done!..."
