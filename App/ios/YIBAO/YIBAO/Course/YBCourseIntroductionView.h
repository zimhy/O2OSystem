//
//  YBCourseIntroductionView.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/28.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBCourseIntroductionView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *courseImage;
@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *oganizationName;
@property (weak, nonatomic) IBOutlet UITextView *info;

@end
