ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
THEOS_PACKAGE_DIR_NAME = debs

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppPercent
AppPercent_FILES = Tweak.xm
AppPercent_FRAMEWORKS = UIKit
AppPercent_LDFLAGS += -Wl,-segalign,4000
AppPercent_PRIVATE_FRAMEWORKS=BulletinBoard

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += AppPercent
include $(THEOS_MAKE_PATH)/aggregate.mk
