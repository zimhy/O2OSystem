//
//  YBTicketViewCell.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBTicketViewCell.h"

@implementation YBTicketViewCell
-(void)setupCell:(NSString *)imageUrl : (NSString *) couresName : (NSString *) teacherName : (NSString *) oganizationName :(NSString *) ticketCode
{
    self.courseImage.image = [UIImage imageNamed:imageUrl] ;
    self.coursename.text = couresName ;
    self.teacherName.text   =teacherName ;
    self.oganizationName.text = oganizationName ;

        self.ticketCode.text = [NSString stringWithFormat:@"%@%@",@"优惠码：",ticketCode] ;
    
    
    
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
    
}


@end
