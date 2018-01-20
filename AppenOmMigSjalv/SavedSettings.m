//
//  SavedSettings.m
//  AppenOmMigSjalv
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "SavedSettings.h"
#import <UIKit/UIKit.h>

@implementation SavedSettings
+(void)saveBackgroundColorsRed:(float)red green:(float)green blue:(float)blue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setFloat:red forKey:@"redColor"];
    [defaults setFloat:green forKey:@"greenColor"];
    [defaults setFloat:blue forKey:@"blueColor"];
    [defaults synchronize];
}

+(UIColor*)loadBackgroundColors{
    float r = [[NSUserDefaults standardUserDefaults]floatForKey:@"redColor"];
    float g = [[NSUserDefaults standardUserDefaults]floatForKey:@"greenColor"];
    float b = [[NSUserDefaults standardUserDefaults]floatForKey:@"blueColor"];
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

+(void)saveDifficulty:(int)diff{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:diff forKey:@"difficulty"];
}

+(int)loadDifficulty{
    return (int)[[NSUserDefaults standardUserDefaults]integerForKey:@"difficulty"];
}
@end
