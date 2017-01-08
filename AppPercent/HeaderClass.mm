#import "header/PSListController.h"
#import "header/PSSpecifier.h"
#import "header/PSViewController.h"
#import "header/PSTableCell.h"

@interface AppPercentSettingsController : PSTableCell {
    UILabel *heading;
    UILabel *subtitle;
    UIImageView *imgView;
}
@end

@implementation AppPercentSettingsController



- (id)initWithSpecifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HeaderClass" specifier:specifier];
    if (self) {


       self.backgroundColor = [UIColor clearColor];
        int width = [[UIScreen mainScreen] bounds].size.width;
        CGRect frame = CGRectMake(0, 20, width, 65);
        CGRect subFrame = CGRectMake(0, 50, width, 65);

        heading = [[UILabel alloc] initWithFrame:frame];
        [heading setNumberOfLines:1];
        heading.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:50];
        [heading setText:@"APP Percent"]; //Change this to whatever you want..
        [heading setBackgroundColor:[UIColor clearColor]];
        heading.textColor = [UIColor blackColor];
        heading.textAlignment = NSTextAlignmentCenter;

        subtitle = [[UILabel alloc] initWithFrame:subFrame];
        [subtitle setNumberOfLines:1];
        subtitle.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
        [subtitle setText:@"Copyright © 2017 Pax Cex "];  //Change this to whatever you want..
        [subtitle setBackgroundColor:[UIColor clearColor]];
        subtitle.textColor = [UIColor colorWithRed:0.08 green:0.37 blue:0.93 alpha:1.0];
        subtitle.textAlignment = NSTextAlignmentCenter;

        [self addSubview:heading];
        [self addSubview:subtitle];



    }

    return self;
}
- (CGFloat)preferredHeightForWidth:(double)arg1 inTableView:(id)arg2 {
    return 120.0; //If you changed the height of the image, change this too
}

@end
