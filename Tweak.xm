@interface SBDownloadingIcon
-(CGFloat)progressPercent;
@end

%hook SBDownloadingIcon
- (id)displayNameForLocation:(int)location
{
    NSString *ret = %orig;
    return [NSString stringWithFormat:@"%0.0f%%, %@", 100 * [self progressPercent], ret];
}
%end
