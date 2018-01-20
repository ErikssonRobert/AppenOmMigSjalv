//
//  ViewControllerAbout.m
//  AppenOmMigSjalv
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "ViewControllerAbout.h"
#import "SavedSettings.h"

@interface ViewControllerAbout ()

@end

@implementation ViewControllerAbout

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
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
