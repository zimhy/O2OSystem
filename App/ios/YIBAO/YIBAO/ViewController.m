//
//  ViewController.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/5.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "ViewController.h"
#import "YBCourseController.h"
#import "YBProfileViewController.h"
#import "YBLoginController.h"
#import "YBAccountTool.h"
#import "YBHomePageController.h"
#import "YBProfileRootController.h"

@interface ViewController ()
@property YBCourseController *course ;
@property YBProfileRootController *profileRoot ;
@property YBLoginController *login ;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // ［UIApplication sharedApplication setStatus BarHidden：YES]    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO] ;
    
    
   
    [self setUpAllChildViewController];
    
    // 自定义tabBar
    [self setUpTabBar];
    

}
-(void) setUpAllChildViewController
{
    _course = [[YBCourseController alloc] initWithRootViewController:[[YBHomePageController alloc]init ]] ;
    [self setUpOneChildViewController:_course image:[UIImage imageNamed:@"tabbar_home" ] selectedImage:[UIImage imageNamed:@"tabbar_home_selected"] title:@"课程"];
//    if([YBAccountTool isLogined])
//    {
         YBProfileViewController *profile = [[YBProfileViewController alloc]initWithNibName:@"YBProfileViewController" bundle:nil] ;
        _profileRoot  = [[YBProfileRootController alloc]initWithRootViewController:profile] ;
        [self setUpOneChildViewController:_profileRoot image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNamed:@"tabbar_profile_selected"] title:@"我"];
      //  [self addChildViewController:_profile] ;
//    }else
//    {
//        _login = [[YBLoginController alloc] init ] ;
//       // [self addChildViewController:_login] ;
//     //   [self ]
//    }
    
}
-(void)setUpTabBar
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YBScreenW, self.tabBar.frame.size.height )];
    backView.backgroundColor = [UIColor colorWithRed:48/255.0 green:63/255.0 blue:159/255.0 alpha:1.0];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    //[self.tabBar setBackgroundColor:[UIColor colorWithRed:48/255.0 green:63/255.0 blue:159/255.0 alpha:1.0]];
    [self.tabBar setTintColor:[UIColor orangeColor] ] ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    
    //vc.tabBarItem.badgeValue = @"10";
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self addChildViewController:vc];
}


@end
