//
//  ViewControllerSettings.m
//  AppenOmMigSjalv
//
//  Created by lösen är 0000 on 2018-01-15.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "ViewControllerSettings.h"
#import "SavedSettings.h"

@interface ViewControllerSettings ()
@property (weak, nonatomic) IBOutlet UISwitch *switchBackgroundRed;
@property (weak, nonatomic) IBOutlet UISwitch *switchBackgroundGreen;
@property (weak, nonatomic) IBOutlet UISwitch *switchBackgroundBlue;
@property float backgroundRedAmount;
@property float backgroundGreenAmount;
@property float backgroundBlueAmount;

@end

@implementation ViewControllerSettings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getSavedColors];
    
    [self setSwitches];
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadBackgroundColors];
}

-(void)getSavedColors{
    self.backgroundRedAmount = [[NSUserDefaults standardUserDefaults] floatForKey:@"redColor"];
    self.backgroundGreenAmount = [[NSUserDefaults standardUserDefaults] floatForKey:@"greenColor"];
    self.backgroundBlueAmount = [[NSUserDefaults standardUserDefaults] floatForKey:@"blueColor"];
}

-(void)setSwitches{
    if (self.backgroundRedAmount < 0.5f) {
        [self.switchBackgroundRed setOn:NO animated:NO];
    }
    if (self.backgroundGreenAmount < 0.5f) {
        [self.switchBackgroundGreen setOn:NO animated:NO];
    }
    if (self.backgroundBlueAmount < 0.5f) {
        [self.switchBackgroundBlue setOn:NO animated:NO];
    }
}

// Refresh method
- (void)refresh{
    [self setColorsBackground];
    [self setBackgroundColor];
}

// Refresh color for background and text when switch is flipped
- (IBAction)switchChanged:(id)sender {
    [self refresh];
}

// Sets values for red green and blue and saves them in SavedSettings
- (void)setColorsBackground{
    if (self.switchBackgroundRed.isOn) {
        self.backgroundRedAmount = 0.6f;
    } else {
        self.backgroundRedAmount = 0;
    }
    if (self.switchBackgroundGreen.isOn){
        self.backgroundGreenAmount = 0.6f;
    } else {
        self.backgroundGreenAmount = 0;
    }
    if (self.switchBackgroundBlue.isOn){
        self.backgroundBlueAmount = 0.6f;
    } else {
        self.backgroundBlueAmount = 0;
    }
    if (!self.switchBackgroundRed.isOn &&
        !self.switchBackgroundGreen.isOn &&
        !self.switchBackgroundBlue.isOn) {
        self.backgroundRedAmount = 0.3f;
        self.backgroundGreenAmount = 0.3f;
        self.backgroundBlueAmount = 0.3f;
    }
    [SavedSettings saveBackgroundColorsRed:self.backgroundRedAmount green:self.backgroundGreenAmount blue:self.backgroundBlueAmount];
}

// Gets backgroundcolor from Saved Settings
- (void)setBackgroundColor{
    self.view.backgroundColor = [SavedSettings loadBackgroundColors];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
