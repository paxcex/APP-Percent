ARCHS = armv7 arm64
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AppPercent
AppPercent_FILES = AppPercent.mm HeaderClass.mm
AppPercent_INSTALL_PATH = /Library/PreferenceBundles
AppPercent_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics Foundation AVFoundation Accelerate GLKit AudioToolbox
AppPercent_PRIVATE_FRAMEWORKS = Preferences
AppPercent_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AppPercent.plist$(ECHO_END)
