//
//  YBProfileTableViewCell.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/25.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBProfileTableViewCell : UITableViewCell
-(void)setupCell:(NSString *)imageUrl : (NSString *) prifileSetName :(NSNumber *) cellHeight;
@property (weak, nonatomic) IBOutlet UILabel *profileSetName;
@property (weak, nonatomic) IBOutlet UIImageView *profileIcon;
@end
