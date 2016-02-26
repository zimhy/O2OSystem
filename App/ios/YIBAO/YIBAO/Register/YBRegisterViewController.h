//
//  YBRegisterViewController.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/26.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBRegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *registerStatus;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *emai;
@property (weak, nonatomic) IBOutlet UITextField *pswd;
@property (weak, nonatomic) IBOutlet UITextField *pswdConfirm;

@property (weak, nonatomic) IBOutlet UIButton *nextStepBtn;
- (IBAction)TextField_DidEndOnExit:(id)sender;
@end
