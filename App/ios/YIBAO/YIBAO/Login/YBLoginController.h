//
//  YBLoginController.h
//  YIBAO
//
//  Created by menghaizhang on 16/1/5.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBLoginController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UIView *textFieldBackGround;
@property (weak, nonatomic) IBOutlet UITextField *mailText;
@property (weak, nonatomic) IBOutlet UITextField *pswdText;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *RegisterBtn;
- (IBAction)beginRegister:(id)sender;

@end
