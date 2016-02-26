//
//  YBRegisterDetailViewController.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/26.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBRegisterDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *registerStatus;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *sexText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *favoritesText;
@property (weak, nonatomic) IBOutlet UIButton *nextStepBtn;
- (IBAction)toEndRegister:(id)sender;
- (IBAction)TextField_DidEndOnExit:(id)sender;
@end
