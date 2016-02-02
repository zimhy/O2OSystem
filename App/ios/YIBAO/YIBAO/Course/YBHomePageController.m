//
//  YBCourseController.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/5.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBHomePageController.h"
#import "YBHomePageView.h"
#import "YBImageScrollView.h"
#import <UIKit/UIKit.h>
//#import "header"

@interface YBHomePageController ()<UIScrollViewDelegate>
@property YBImageScrollView *carousel ;
@property NSTimer *timer ;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation YBHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:225/255.0 green:224/255.0 blue:222/255.0 alpha:1.0] ;
    NSLog(@"%@",self.view) ;
    self.navigationItem.title = @"课程" ;
    [self loadCarousel] ;
    [self loadCourseTypes] ;
   }


-(void)loadCarousel
{
    
//    _carousel = [[YBImageScrollView alloc] initWithFrame:CGRectMake(111, 111, YBScreenW,480/800*YBScreenH)];
//    _carousel.backgroundColor = [UIColor blackColor] ;
//    _button = [[UIButton alloc]initWithFrame:CGRectMake(111, 111, YBScreenW,480/800*YBScreenH) ];
//    _button.titleLabel.text = @"aaaa" ;
//    self.view.backgroundColor = [UIColor blackColor] ;
    _carousel = [[YBImageScrollView alloc] initWithFrame:CGRectMake(0, 0, YBScreenW,YBScreenH*270/800) ] ;
    
    for (int i = 0 ; i < 5 ; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
         //        图片X
                 CGFloat imageX = i * YBScreenW;
         //        设置frame
        imageView.frame =CGRectMake(imageX, 0, YBScreenW,YBScreenH*180/800);
        //        设置图片
          //       NSString *name = [NSString stringWithFormat:@"img_0%d", i + 1];
        imageView.image = [UIImage imageNamed:@"loading"];
         //        隐藏指示条
        _carousel.showsHorizontalScrollIndicator = NO;
        
                [_carousel addSubview:imageView];
    }
    
    //    2.设置scrollview的滚动范围
    CGFloat contentW = 5 * YBScreenW;
    //不允许在垂直方向上进行滚动
    _carousel.contentSize = CGSizeMake(contentW, 0);
    
    //    3.设置分页
    _carousel.pagingEnabled = YES;
    
    //    4.监听scrollview的滚动
    _carousel.delegate = self;
    
    [self addTimer];
    
    //image.center = CGPointMake(200/1, 200/1) ;
    NSLog(@"%@ ",_carousel) ;
    [self.view addSubview:_carousel];
    _pageControl = [[UIPageControl alloc] init] ;
    _pageControl.numberOfPages = 5 ;
    [self.view addSubview:_pageControl] ;
//    [self.view addSubview:_carousel] ;
 //   [self]
}
-(void)loadCourseTypes
{
    //TODO
}

/**
 *  开启定时器
 */
- (void)addTimer{
    
  //  self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    }
/**
 *  关闭定时器
 */
- (void)removeTimer
{
    [self.timer invalidate];
}

-(IBAction)buttonClicked:(id)sender

{
    
    NSLog(@"button Clicked!");
    
    
}

- (void)nextImage
{
    
    int  page = (int)self.pageControl.currentPage;
    if (page == 4) {
        page = 0;
    }else
    {
        page++;
    }
    
    NSLog(@"page ----%d", page);
    //  滚动scrollview
    CGFloat x = page * _carousel. frame.size.width;
    _carousel .contentOffset = CGPointMake(x, 0);
}

// scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滚动中");
    //    计算页码
    //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
    CGFloat scrollviewW =  scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollviewW / 2) /  scrollviewW;
    self.pageControl.currentPage = page;
}

// 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
    //    [self.timer invalidate];
    //[self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    开启定时器
    [self addTimer];
}


@end
