//
//  YBLoginRootController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/26.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBLoginRootController.h"

@interface YBLoginRootController ()

@end

@implementation YBLoginRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _login =  [self.viewControllers objectAtIndex:0] ;
    //先不写NavigationBar
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:48/255.0 green:63/255.0 blue:159/255.0 alpha:1.0]];
    self.navigationBar.frame  = CGRectMake(0, 0, YBScreenW, YBScreenH*50/800) ;
    self.navigationBar.backItem.backBarButtonItem.image = [UIImage imageNamed:@"abc_ic_ab_back_mtrl_am_alpha"] ;
    //    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    self.hidesBottomBarWhenPushed = YES;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
//{
//    self = [super initWithRootViewController:rootViewController] ;
//    return self ;
//}

@end
