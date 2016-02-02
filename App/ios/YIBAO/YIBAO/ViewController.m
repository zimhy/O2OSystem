//
//  ViewController.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/5.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "ViewController.h"
<<<<<<< HEAD
#import "YBCourseController.h"
#import "YBProfileController.h"
#import "YBLoginController.h"
#import "YBAccountTool.h"

@interface ViewController ()
@property YBCourseController *course ;
@property YBProfileController *profile ;
@property YBLoginController *login ;
@end
=======

@interface ViewController ()

@end

>>>>>>> f3c09bf5e463270ad7157eef4226701c44d8b842
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
    
    // Do any additional setup after loading the view.
    
    // 添加所有子控制器
    [self.tabBar setTintColor:[UIColor orangeColor] ] ;
    [self setUpAllChildViewController];
    
    // 自定义tabBar
    [self setUpTabBar];
    

}
-(void) setUpAllChildViewController
{
    _course = [[YBCourseController alloc] init] ;
    [self setUpOneChildViewController:_course image:[UIImage imageNamed:@"tabbar_home" ] selectedImage:[UIImage imageNamed:@"tabbar_home_selected"] title:@"课程"];
    if([YBAccountTool isLogined])
    {   _profile = [[YBProfileController alloc]init] ;
        [self setUpOneChildViewController:_profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNamed:@"tabbar_profile_selected"] title:@"我"];
      //  [self addChildViewController:_profile] ;
    }else
    {
        _login = [[YBLoginController alloc] init ] ;
       // [self addChildViewController:_login] ;
     //   [self ]
    }
    
}
-(void)setUpTabBar
{
    //TODO
}
=======
    // Do any additional setup after loading the view, typically from a nib.
}

>>>>>>> f3c09bf5e463270ad7157eef4226701c44d8b842
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

<<<<<<< HEAD
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    
    vc.tabBarItem.badgeValue = @"10";
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self addChildViewController:vc];
}


=======
>>>>>>> f3c09bf5e463270ad7157eef4226701c44d8b842
@end
