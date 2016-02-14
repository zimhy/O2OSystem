//
//  YBCourseTypeCell.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/20.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBCourseTypeCell.h"
#import "UIImage+Scale.h"

@implementation YBCourseTypeCell





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:225/255.0 green:224/255.0 blue:222/255.0 alpha:1.0] ;
        //self.backGroundView.frame.size.width = self.frame.
        
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
    self.courseTypeImage.image = [UIImage imageNamed:imageUrl] ;
    self.courseTypeName.text = couresTypeName ;
    
}
@end
