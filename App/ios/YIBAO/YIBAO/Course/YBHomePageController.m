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
#import "YBCourseTypeCell.h"
#import "YBCourseListController.h"
#import <UIKit/UIKit.h>
//#import "header"

@interface YBHomePageController ()<UIScrollViewDelegate>
@property YBImageScrollView *carousel ;
@property NSArray *courseArray ;
@property NSArray *carouselArray ;
@property NSTimer *timer ;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation YBHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:225/255.0 green:224/255.0 blue:222/255.0 alpha:1.0] ;
    NSLog(@"%@",self.view) ;
    //self
    self.navigationItem.title = @"课程" ;
    [self loadCarousel] ;
    [self loadCourseTypes] ;
   }


-(void)loadCarousel
{
        _carousel = [[YBImageScrollView alloc] initWithFrame:CGRectMake(0, 0, YBScreenW,YBScreenH*270/800) ] ;
    _carouselArray = @[@"ad_1",@"ad_2",@"ad_3",@"ad_4",@"ad_5"];
    for (int i = 0 ; i < 5 ; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
         //        图片X
                 CGFloat imageX = i * YBScreenW;
         //        设置frame
        imageView.frame =CGRectMake(imageX, 0, YBScreenW,YBScreenH*180/800);
        //        设置图片
          //       NSString *name = [NSString stringWithFormat:@"img_0%d", i + 1];
        imageView.image = [UIImage imageNamed:_carouselArray[i]];
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
    
    [self.view addSubview:_carousel];
    _pageControl = [[UIPageControl alloc] init] ;
    _pageControl.numberOfPages = 5 ;
    [self.view addSubview:_pageControl] ;
}
-(void)loadCourseTypes
{
    _courseArray = @[@[@"class_shengyue", @"声乐"],
                     @[@"class_gangqin", @"钢琴"],
                     @[@"class_shoutiqin", @"手提琴"],
                     @[@"class_jiazigu", @"架子鼓"],
                     @[@"class_wudao", @"舞蹈"]];
    
    UITableView *courseTypes  = [[UITableView alloc]initWithFrame:CGRectMake(0, YBScreenH*270/800, YBScreenW, YBScreenH*480/800) ];
    //UITableViewCell *courseType = [[[NSBundle mainBundle] loadNibNamed:@"YBCourseTypeCell" owner:self options:nil] lastObject];
    [courseTypes setSeparatorStyle:UITableViewCellSeparatorStyleNone] ;
    courseTypes.backgroundColor = [UIColor colorWithRed:221/255 green:220/255 blue:218/255 alpha:0] ;
    courseTypes.delegate = self ;
    courseTypes.dataSource = self ;
    [self.view addSubview:courseTypes ] ;
    
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
   // NSLog(@"滚动中");
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



/**
 1、返回 UITableView 的区段数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1 ;
}

/**
 2、返回 UITableView 的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _courseArray.count;}

/**
 3、设置行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0 ;
}
/**
 4、返回指定的 row 的 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. cell标示符，使cell能够重用
    static NSString *YBCourseTypeCellID = @"YBCourseTypeCell";
    // 2. 从TableView中获取标示符为paperCell的Cell
    YBCourseTypeCell *cell = (YBCourseTypeCell *)[tableView dequeueReusableCellWithIdentifier:YBCourseTypeCellID];
    // 如果 cell = nil , 则表示 tableView 中没有可用的闲置cell
    if(cell == nil){
        // 3. 把 WPaperCell.xib 放入数组中
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YBCourseTypeCell" owner:self options:nil] ;
        
        // 获取nib中的第一个对象
        for (id oneObject in nib){
            // 判断获取的对象是否为自定义cell
            if ([oneObject isKindOfClass:[YBCourseTypeCell class]]){
                // 4. 修改 cell 对象属性
                cell = [(YBCourseTypeCell *)oneObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YBCourseTypeCellID];
            }
        }
    }
    // 5. 设置单元格属性
    //TODO
    [cell setupCell:_courseArray[indexPath.row][0]:_courseArray[indexPath.row][1]];
//    CGRect frame  = cell.frame ;
//    NSLog(@"%f",frame.size.height) ;
//    cell.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,frame.size.height-40) ;
//     NSLog(@"%f",cell.frame.size.height) ;
//    cell.backgroundColor = [UIColor grayColor] ;
    return cell;
}
/**
 5、点击单元格时的处理
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       YBCourseListController *list = [[YBCourseListController alloc]init] ;
    [self.navigationController pushViewController:list animated:YES ] ; 
   }


@end
