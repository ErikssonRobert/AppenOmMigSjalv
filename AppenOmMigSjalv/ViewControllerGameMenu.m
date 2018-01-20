//
//  ViewControllerGameMenu.m
//  AppenOmMigSjalv
//
//  Created by lösen är 0000 on 2018-01-15.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "ViewControllerGameMenu.h"
#import "SavedSettings.h"

@interface ViewControllerGameMenu ()
@property (weak, nonatomic) IBOutlet UILabel *textDifficulty;
@property (weak, nonatomic) IBOutlet UISlider *sliderDifficulty;

@property (nonatomic) int diff;

@end

@implementation ViewControllerGameMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refresh];
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadBackgroundColors];
}

// Refresh label showing difficulty
- (void)refresh{
    self.textDifficulty.text = [self setDifficultyText];
    [SavedSettings saveDifficulty:self.diff];
}

// Controls wich difficulty label should show and returns it
- (NSString*)setDifficultyText{
    if (self.sliderDifficulty.value >= 0 &&
        self.sliderDifficulty.value < 0.5) {
        self.sliderDifficulty.value = 0;
        self.diff = 1;
        return @"Lätt";
    } else if (self.sliderDifficulty.value >= 0.5 &&
               self.sliderDifficulty.value < 1.5){
        self.sliderDifficulty.value = 1;
        self.diff = 2;
        return @"Medel";
    } else {
        self.sliderDifficulty.value = 2;
        self.diff = 3;
        return @"Svår";
    }
}

// Refreshes the label showing the difficulty
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
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
