//
//  ViewControllerGuessGame.m
//  AppenOmMigSjalv
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "ViewControllerGuessGame.h"
#import "SavedSettings.h"

@interface ViewControllerGuessGame ()
@property (weak, nonatomic) IBOutlet UILabel *labelGuessBetween;
@property (weak, nonatomic) IBOutlet UILabel *labelGuessNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelWrongOrRight;

@property (weak, nonatomic) IBOutlet UISlider *sliderGuessNumber;

@property (weak, nonatomic) IBOutlet UIButton *buttonPlusOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonMinusOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonGuess;

@property (nonatomic) int randomNumber;
@property (nonatomic) int diff;
@end

@implementation ViewControllerGuessGame

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadBackgroundColors];
    self.diff = [SavedSettings loadDifficulty];
    [self startNewGame];
}

// Presents the value chosen with slider
-(void)setLabelGuessNumber{
    self.labelGuessNumber.text = [NSString stringWithFormat:@"%d", (int)self.sliderGuessNumber.value];
}

-(void)startNewGame{
    [self setDifficulty];
    [self setLabelGuessNumber];
    self.labelWrongOrRight.text = @"";
}
// Slider max/min values changed based on difficulty
-(void)setDifficulty{
    if (self.diff == 1) {
        [self setEasyMode];
    } else if (self.diff == 2){
        [self setNormalMode];
    } else if (self.diff == 3){
        [self setHardMode];
    }
}

// Sets values for easy mode
-(void)setEasyMode{
    self.labelGuessBetween.text = @"Gissa mellan 1 och 10";
    self.sliderGuessNumber.maximumValue = 10;
    self.sliderGuessNumber.minimumValue = 1;
    self.sliderGuessNumber.value = 5;
    self.randomNumber = arc4random_uniform(10) + 1;
}

// Sets values for normal mode
-(void)setNormalMode{
    self.labelGuessBetween.text = @"Gissa mellan 1 och 100";
    self.sliderGuessNumber.maximumValue = 100;
    self.sliderGuessNumber.minimumValue = 1;
    self.sliderGuessNumber.value = 50;
    self.randomNumber = arc4random_uniform(100) + 1;
}

// Sets values for hard mode
-(void)setHardMode{
    self.labelGuessBetween.text = @"Gissa mellan 1 och 1000";
    self.sliderGuessNumber.maximumValue = 1000;
    self.sliderGuessNumber.minimumValue = 1;
    self.sliderGuessNumber.value = 500;
    self.randomNumber = arc4random_uniform(1000) + 1;
}

- (IBAction)sliderGuessNumberChanged:(id)sender {
    [self setIntValueToSlider];
    [self setLabelGuessNumber];
}

// Controls the float value and sets an int instead
- (void)setIntValueToSlider{
    for (int i = 1; i < self.sliderGuessNumber.maximumValue + 1; i++) {
        if (self.sliderGuessNumber.value > (i - 0.5) &&
            self.sliderGuessNumber.value < (i + 0.5)) {
            self.sliderGuessNumber.value = i;
        }
    }
}

- (IBAction)buttonGuessPressed:(id)sender {
    if (self.randomNumber < self.sliderGuessNumber.value) {
        self.labelWrongOrRight.text = @"Fel, svaret är lägre!";
    } else if (self.randomNumber > self.sliderGuessNumber.value) {
        self.labelWrongOrRight.text = @"Fel, svaret är högre!";
    } else {
        self.labelWrongOrRight.text = @"Grattis, du hade rätt!";
    }
}

- (IBAction)buttonMinusOnePressed:(id)sender {
    self.sliderGuessNumber.value--;
    [self setLabelGuessNumber];
}

- (IBAction)buttonPlusOnePressed:(id)sender {
    self.sliderGuessNumber.value++;
    [self setLabelGuessNumber];
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
