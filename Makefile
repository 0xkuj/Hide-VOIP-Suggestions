export TARGET = iphone:clang:11.4:11.4
INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RemoveVOIP

RemoveVOIP_FILES = Tweak.x
RemoveVOIP_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
