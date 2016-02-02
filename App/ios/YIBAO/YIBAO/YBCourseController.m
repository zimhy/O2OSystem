//
//  YBCourseController.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/14.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBCourseController.h"

@implementation YBCourseController
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController] ;
    _homePage =  [self.viewControllers objectAtIndex:0] ;
    //先不写NavigationBar
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:48/255.0 green:63/255.0 blue:159/255.0 alpha:1.0]];
    self.navigationBar.frame  = CGRectMake(0, 0, YBScreenW, YBScreenH*50/800) ;
    self.navigationBar.backItem.backBarButtonItem.image = [UIImage imageNamed:@"abc_ic_ab_back_mtrl_am_alpha"] ;
//    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    return self ;
    
}
@end
