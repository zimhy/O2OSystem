//
//  YBCouseViewCell.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QCheckBox.h"

@interface YBCouseViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *courseImage;
@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *oaganizationName;
@property QCheckBox *isSelected ;
-(void)setupCell:(NSString *)imageUrl : (NSString *) couresName : (NSString *) teacherName : (NSString *) oganizationName ;
-(void)showCheckBox   :(id) delegate;
@end
