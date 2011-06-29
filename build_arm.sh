#!/bin/sh
make clean
make LIBSPOTIFY_PATH=./arm CC=arm-angstrom-linux-gnueabi-gcc
