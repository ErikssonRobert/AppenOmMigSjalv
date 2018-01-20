//
//  SavedSettings.h
//  AppenOmMigSjalv
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SavedSettings : NSObject

+(void)saveBackgroundColorsRed:(float)red green:(float)green blue:(float)blue;

+(UIColor*)loadBackgroundColors;

+(void)saveDifficulty:(int)diff;

+(int)loadDifficulty;

@end
