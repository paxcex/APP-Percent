#import "writeData.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <substrate.h>


@interface SBDownloadingIcon
-(id)displayNameForLocation;
-(CGFloat)progressPercent;;
@end

@interface FBBundleInfo : NSObject

@property(copy, nonatomic) NSString *displayName;

@end

@interface FBApplicationPlaceholder : FBBundleInfo

@property(readonly, nonatomic) double percentComplete;

@end

@interface SBBulletinBannerController : NSObject

+ (instancetype)sharedInstance;
- (void)observer:(id)observer addBulletin:(id)bulletin forFeed:(NSUInteger)feed;

@end

@interface BBBulletin : NSObject

@property(copy) NSString * title;
@property(copy) NSString * message;
@property(copy) NSString * bulletinID;
@property(copy) NSString * sectionID;

@end

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.pxcex.apppercent.plist"

inline bool GetPrefBool(NSString *key) {
		return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

%hook SBDownloadingIcon
- (id)displayNameForLocation:(int)location
{
	if(GetPrefBool(@"Enable")){
    NSString *ret = %orig;
    return [NSString stringWithFormat:@"%0.0f%%, %@", 100 * [self progressPercent], ret];
}
return %orig;
}
%end

%hook FBApplicationPlaceholder

- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4 {
	%orig;
	if(GetPrefBool(@"Banner")){

	if (self.percentComplete == 0.96) {
        BBBulletin *bulletin = [[[BBBulletin alloc] init] autorelease];
        bulletin.sectionID = @"com.apple.AppStore";
        bulletin.message = [self.displayName stringByAppendingString:@" Unduhan Selesai."];
        [(SBBulletinBannerController *)[%c(SBBulletinBannerController) sharedInstance] observer:nil addBulletin:bulletin forFeed:2];
	}
}
return %orig;
}

%end
