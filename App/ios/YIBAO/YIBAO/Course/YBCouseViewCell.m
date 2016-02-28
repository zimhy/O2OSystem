//
//  YBCouseViewCell.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBCouseViewCell.h"

@implementation YBCouseViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setFrame:(CGRect)frame
{
    NSInteger inset  = 1 ;
    frame.origin.x += 2*inset;
    frame.size.width -= 4 * inset;
    frame.origin.y += inset/2 ;
    frame.size.height -= inset ;
    [super setFrame:frame];
    if(_courseImage!=nil)
    {
        _courseImage.center = CGPointMake(self.frame.size.width - _courseImage.frame.size.width/2 -10,self.frame.size.height/2) ;
    }
//    if(_teacherName!=nil)
//    {
//       _teacherName.center = CGPointMake(_teacherName.center.x, self.frame.size.height/2) ;
//    }
    
}



-(void)setupCell:(NSString *)imageUrl : (NSString *) couresName : (NSString *) teacherName : (NSString *) oganizationName
{
    self.courseImage.image = [UIImage imageNamed:imageUrl] ;
    self.courseName.text = couresName ;
    self.teacherName.text   =teacherName ;
    self.oaganizationName.text = oganizationName ;
    
}


-(void)showCheckBox :(id) delegate
{
    _isSelected = [[QCheckBox alloc] initWithDelegate:delegate];
    _isSelected.frame = CGRectMake(1, 40-8, 15, 15) ;
    //_isSelected.center = CGPointMake(40, 8) ;
    [self addSubview:_isSelected] ;
}

@end
