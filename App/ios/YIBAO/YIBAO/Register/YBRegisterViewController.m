//
//  YBRegisterViewController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/26.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBRegisterViewController.h"

@interface YBRegisterViewController ()

@end

@implementation YBRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nextStepBtn.backgroundColor = [UIColor colorWithRed:146/255.0 green:154/255.0 blue:202/255.0 alpha:1.0] ;
    self.nextStepBtn.layer.cornerRadius = 15 ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toDetailRegister:(id)sender {
    [self performSegueWithIdentifier:@"toDetailRegister" sender:self] ;
}
- (IBAction)TextField_DidEndOnExit:(id)sender {
    // 隐藏键盘.
    [sender resignFirstResponder];
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
