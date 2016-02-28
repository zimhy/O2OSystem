//
//  YBCourseListController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBCourseListController.h"
#import "YBCouseViewCell.h"
#import "YBCourseDetailController.h"

@interface YBCourseListController ()<UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *courses ;

@end

@implementation YBCourseListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.translucent = NO;
    _courseList.dataSource = self ;
    _courseList.delegate = self ;
    _courses = [[NSMutableArray alloc] init ] ;
    [_courses  addObject : @[@"class_shengyue", @"声乐" ,@"王尼玛" ,@"新东方"]] ;
    [_courses  addObject : @[@"class_shengyue", @"声乐" ,@"张尼玛" ,@"浙大软院"]] ;
    [_courses  addObject : @[@"class_shengyue", @"声乐" ,@"曹尼玛" ,@"新东方"]] ;
    [_courses  addObject : @[@"class_shengyue", @"声乐" ,@"李尼玛" ,@"新浙大软院"]] ;
    [_courses  addObject : @[@"class_shengyue", @"声乐" ,@"吴尼玛" ,@"浙大软院"]] ;

    

    
}
-(void) addComoBox :(UIButton*)btn :(TableViewWithBlock*) box :(NSArray * )selections :(CGRect) frame
{
    box =[[TableViewWithBlock alloc] initWithFrame:frame ];
    box.isOpened = NO ;
    [_tb initTableViewDataSourceAndDelegate:^(UITableView *tableView,NSInteger section){
        NSInteger num = selections.count ;
        return  num ;;
        
    } setCellForIndexPathBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        SelectionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SelectionCell"];
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"SelectionCell" owner:self options:nil]objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        [cell.lb setText:[NSString stringWithFormat:@"%@",selections[indexPath.row]]];
        return cell;
    } setDidSelectRowBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        SelectionCell *cell=(SelectionCell*)[tableView cellForRowAtIndexPath:indexPath];
        btn.titleLabel.text=cell.lb.text;
        [btn sendActionsForControlEvents:UIControlEventTouchUpInside];
    }];
    
    [_tb.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_tb.layer setBorderWidth:2];
    [self.view addSubview:_tb] ;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    return _courses.count ;
}

/**
 3、设置行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  80 ;
}
/**
 4、返回指定的 row 的 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. cell标示符，使cell能够重用
    static NSString *YBCouseViewCellID = @"YBCouseViewCell";
    // 2. 从TableView中获取标示符为paperCell的Cell
    YBCouseViewCell *cell = (YBCouseViewCell *)[tableView dequeueReusableCellWithIdentifier:YBCouseViewCellID];
    // 如果 cell = nil , 则表示 tableView 中没有可用的闲置cell
    if(cell == nil){
        // 3. 把 WPaperCell.xib 放入数组中
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YBCouseViewCell" owner:self options:nil] ;
        
        // 获取nib中的第一个对象
        for (id oneObject in nib){
            // 判断获取的对象是否为自定义cell
            if ([oneObject isKindOfClass:[YBCouseViewCell class]]){
                // 4. 修改 cell 对象属性
                cell = [(YBCouseViewCell *)oneObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YBCouseViewCellID];
            }
        }
    }
    // 5. 设置单元格属性
    //TODO
    [cell setupCell:_courses[indexPath.row][0]:_courses[indexPath.row][1]:_courses[indexPath.row][2]:_courses[indexPath.row][3]];
    //[cell showCheckBox:self ];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //YBProfileTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath] ;
    YBCourseDetailController *courseDetail = [[YBCourseDetailController alloc] init ] ;
    courseDetail.hidesBottomBarWhenPushed = YES ;
    [self.navigationController pushViewController:courseDetail animated:YES] ;
    
    
    // NSLog(@"%f",cell.backGroundView.frame.size.width);
}




@end
