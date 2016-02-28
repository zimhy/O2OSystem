//
//  YBTicketViewCell.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBCouseViewCell.h"

@interface YBTicketViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *courseImage;
@property (weak, nonatomic) IBOutlet UILabel *coursename;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *oganizationName;
@property (weak, nonatomic) IBOutlet UILabel *ticketCode;
-(void)setupCell:(NSString *)imageUrl : (NSString *) couresName : (NSString *) teacherName : (NSString *) oganizationName :(NSString *) ticketCode;
@end
