//
//  YBCourseDetailController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBCourseDetailController.h"
#import "YBCourseIntroductionView.h" 
#import "YBTeacherDetailView.h" 
#import "YBOganizationDetail.h"
#import "YBCommentViewCell.h"

@interface YBCourseDetailController ()
@property YBCourseIntroductionView *courseInfo ;
@property YBTeacherDetailView *teacherDetail ;
@property YBOganizationDetail *OgnDetail ;
@property UITableView *Comments ;
@property UIView *subView;

@end

@implementation YBCourseDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* objList = [[NSBundle mainBundle] loadNibNamed:@"CourseIntroductionView" owner:self options:nil];
    _courseInfo = [objList firstObject] ;
    _courseInfo.frame =CGRectMake(0, 0, YBScreenW, 300) ;
    [_detailContainer addSubview:_courseInfo ] ;
    
    objList = [[NSBundle mainBundle] loadNibNamed:@"TeacherDetail" owner:self options:nil];
    _teacherDetail = [objList objectAtIndex:0 ] ; ;
    _teacherDetail.frame =CGRectMake(0, 300, YBScreenW, 300) ;
    [_detailContainer addSubview:_teacherDetail ] ;
    objList = [[NSBundle mainBundle] loadNibNamed:@"YBOganizationDetailView" owner:self options:nil];
    _OgnDetail = [objList objectAtIndex:0 ]  ;
    _OgnDetail.frame =CGRectMake(0, 600, YBScreenW, 180) ;
    [_detailContainer addSubview:_OgnDetail ] ;
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"My view frame: %@", NSStringFromCGRect(_subView.frame));

    NSLog(@"My view frame: %@", NSStringFromCGRect(_OgnDetail.frame));
    NSLog(@"My view frame: %@", NSStringFromCGRect(_OgnDetail.image .frame));
}
-(void) viewWillAppear:(BOOL)animated
{
    _detailContainer.contentSize = CGSizeMake(YBScreenW, 1000) ;
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
