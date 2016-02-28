//
//  YBPIMViewController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBPIMViewController.h"

@interface YBPIMViewController ()

@end

@implementation YBPIMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:169/255.0 green:176/255.0 blue:211/255.0 alpha:1.0] ;
    _submitBtn.backgroundColor = [UIColor colorWithRed:146/255.0 green:154/255.0 blue:202/255.0 alpha:1.0] ;}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.translucent = NO;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.translucent = YES;
    
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
