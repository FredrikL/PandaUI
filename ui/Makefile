ifeq ($(shell uname),Darwin)
ifdef USE_AUDIOQUEUE
AUDIO_DRIVER ?= osx
LDFLAGS += -framework AudioToolbox
else
AUDIO_DRIVER ?= openal
LDFLAGS += -framework OpenAL
endif
else
CFLAGS  = $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) pkg-config --cflags alsa --libs gtk+-2.0)
LDFLAGS = $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) pkg-config --libs-only-L alsa  --libs gtk+-2.0)
LDLIBS  = $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) pkg-config --libs-only-l --libs-only-other alsa  --libs gtk+-2.0)
AUDIO_DRIVER ?= alsa
endif

TARGET=ui

include ../common.mk

$(TARGET): ui.o appkey.o $(AUDIO_DRIVER)-audio.o audio.o
playtrack: playtrack.o appkey.o $(AUDIO_DRIVER)-audio.o audio.o

audio.o: audio.c audio.h
alsa-audio.o: alsa-audio.c audio.h
dummy-audio.o: dummy-audio.c audio.h
osx-audio.o: osx-audio.c audio.h
openal-audio.o: openal-audio.c audio.h
playtrack.o: playtrack.c audio.h
ui.o: ui.c audio.h
