#import <Preferences/Preferences.h>

@interface AppPercentListController: PSListController {
}
@end

@implementation AppPercentListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"AppPercent" target:self];
	}
	return _specifiers;
}

/* The "Visit iOSGods.com" link inside the Preferences button */
- (void)link {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://iosgods.com"]];
}
@end

// vim:ft=objc
