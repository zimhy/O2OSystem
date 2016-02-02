//
//  YBHomePageView.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/14.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBHomePageView.h"

@implementation YBHomePageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //_carousel = [[YBImageScrollView alloc]initWithFrame:CGRectMake(0, 0,YBScreenW , YBScreenH*480/800)] ;
           UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, YBScreenW,480/800*YBScreenH) ];
        button.backgroundColor = [UIColor blackColor] ;
           button.titleLabel.text = @"aaaa" ;
//        _button = button ;
        //[self addSubview:_carousel ];
        [self addSubview:_button] ;
    }
    return self;
}


@end
