//
//  YBProfileTableViewCell.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/25.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBProfileTableViewCell.h"

@implementation YBProfileTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor] ;
        //self.backGroundView.frame.size.width = self.frame.
        //CGRect frame  = self.frame ;
        //self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,frame.size.height-40) ;
        //NSLog(@"%@",self.backGroundView.frame) ;
        
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

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if(_profileIcon!=nil)
    {
        _profileIcon.center = CGPointMake(_profileIcon.frame.size.width+10,self.frame.size.height/2) ;
    }
    if(_profileSetName!=nil)
    {
        _profileSetName.center = CGPointMake(self.center.x, self.frame.size.height/2) ;
    }
    

    
}





-(void)setupCell:(NSString *)imageUrl : (NSString *) couresTypeName :(NSNumber *) cellHeight
{
    NSLog(@"%f" ,cellHeight.floatValue) ;
    self.profileIcon.frame = CGRectMake(_profileSetName.frame.origin.x, _profileSetName.frame.origin.y, cellHeight.floatValue*0.6, cellHeight.floatValue*0.6) ; ;
    self.profileIcon.image = [UIImage imageNamed:imageUrl] ;
    self.profileSetName.text = couresTypeName ;
    _profileIcon.center =CGPointMake(_profileIcon.frame.size.width/2+10,cellHeight.floatValue/2) ;
    _profileSetName.center = CGPointMake(self.center.x, cellHeight.floatValue/2) ;
}

@end
