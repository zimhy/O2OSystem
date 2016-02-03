//
//  YBCourseTypeCell.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/20.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBCourseTypeCell.h"

@implementation YBCourseTypeCell





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}





- (void)awakeFromNib {
    // Initialization code
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCell:(NSString *)imageUrl : (NSString *) couresTypeName
{
    self.courseTypeImage  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageUrl]] ;
    self.courseTypeName = couresTypeName ;
}
@end
