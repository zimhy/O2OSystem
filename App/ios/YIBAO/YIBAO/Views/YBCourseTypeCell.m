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
        self.backgroundColor = [UIColor whiteColor] ;
        //self.backGroundView.frame.size.width = self.frame.
        CGRect frame  = self.frame ;
        //self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,frame.size.height-40) ;
        //NSLog(@"%@",self.backGroundView.frame) ;
        
    }
    return self;
}



- (void)setFrame:(CGRect)frame
{
    NSInteger inset  = 10 ;
    frame.origin.x += 2*inset;
    frame.size.width -= 4 * inset;
    frame.origin.y += inset/2 ;
    frame.size.height -= inset ;
    [super setFrame:frame];
    if(_courseTypeImage!=nil)
    {
        _courseTypeImage.center = CGPointMake(_courseTypeImage.frame.size.width+10,self.frame.size.height/2) ;
    }
    if(_courseTypeName!=nil)
    {
        _courseTypeName.center = CGPointMake(self.center.x, self.frame.size.height/2) ;
    }
    
}

- (void)setcourseTypeImage:(UIImageView*)courseTypeImage
{
    courseTypeImage.center = CGPointMake(courseTypeImage.frame.size.width+10,self.frame.size.height/2) ;
    _courseTypeImage = courseTypeImage ;
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
