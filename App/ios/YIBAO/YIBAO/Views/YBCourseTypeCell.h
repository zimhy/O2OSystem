//
//  YBCourseTypeCell.h
//  YIBAO
//
//  Created by menghaizhang on 16/1/20.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBCourseTypeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *courseTypeImage;
@property (weak, nonatomic) IBOutlet UILabel *courseTypeName;

-(void)setupCell:(NSString *)imageUrl : (NSString *) couresTypeName;
@end
