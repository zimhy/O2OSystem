//
//  YBProfileViewController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/24.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBProfileViewController.h"
#import "YBProfileTableViewCell.h"
#import "UIImage+scale.h"


@interface YBProfileViewController ()
@property NSArray* profileArray ;
@property NSMutableArray* cellHeights ;
@end

@implementation YBProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.hidesBottomBarWhenPushed = YES ;
    UIImage *image = [[UIImage imageNamed:@"my_bg"]scaleToSize:CGSizeMake(YBScreenW, 0.35*YBScreenH)] ;
   // UIGraphicsEndImageContext();
    
    _headerBackGroundView.backgroundColor = [UIColor colorWithPatternImage:image];
            self.navigationItem.title = @"我" ;
    self.view.backgroundColor = [UIColor colorWithRed:225/255.0 green:224/255.0 blue:222/255.0 alpha:1.0] ;
    
    [self loadprofileTable] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = NO ;
//}

-(void)loadprofileTable
{
    //_profileTables.backgroundColor = [UIColor blueColor] ;
    [_profileTables setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine] ;
    _profileTables.scrollEnabled = NO ;
    _profileTables.delegate = self ;
    _profileTables.dataSource = self ;
    _profileArray = @[@[@"icon_course", @"我的课程"],
                      @[@"icon_shopping", @"购物车"],
                      @[@"icon_ticket", @"优惠券"],
                      @[@"icon_personal", @"个人信息"],
                      ];
    _cellHeights = [NSMutableArray arrayWithCapacity:4] ;
    
    
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
    return _profileArray.count;}

/**
 3、设置行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%f", _profileTables.frame.size.height/4 );
    _cellHeights[indexPath.row] =[NSNumber numberWithFloat:_profileTables.frame.size.height/4 ] ;
    return  _profileTables.frame.size.height/4 ;
}
/**
 4、返回指定的 row 的 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. cell标示符，使cell能够重用
    static NSString *YBProfileTableViewCellID = @"YBProfileTableViewCell";
    // 2. 从TableView中获取标示符为paperCell的Cell
    YBProfileTableViewCell *cell = (YBProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:YBProfileTableViewCellID];
    // 如果 cell = nil , 则表示 tableView 中没有可用的闲置cell
    if(cell == nil){
        // 3. 把 WPaperCell.xib 放入数组中
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YBProfileTableViewCell" owner:self options:nil] ;
        
        // 获取nib中的第一个对象
        for (id oneObject in nib){
            // 判断获取的对象是否为自定义cell
            if ([oneObject isKindOfClass:[YBProfileTableViewCell class]]){
                // 4. 修改 cell 对象属性
                cell = [(YBProfileTableViewCell *)oneObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YBProfileTableViewCellID];
            }
        }
    }
    // 5. 设置单元格属性
    //TODO
    [cell setupCell:_profileArray[indexPath.row][0]:_profileArray[indexPath.row][1] :_cellHeights[indexPath.row]];
    NSLog(@"%f",cell.profileIcon.center.y) ;
      return cell;
}
/**
 5、点击单元格时的处理
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //YBProfileTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath] ;
    
    switch (indexPath.row) {
        case 0:
            if(_myCourse == nil)
            {
                        _myCourse = [[YBMyCourseViewController alloc]init] ;
                _myCourse.hidesBottomBarWhenPushed = YES ;
            }
            [self.navigationController pushViewController:_myCourse animated:YES ] ;
            break;
        case 1:
            if(_shopCart == nil)
            {
                _shopCart = [[YBShopCartViewController alloc]initWithNibName:@"YBShopCartViewController" bundle:nil] ;
                _shopCart.hidesBottomBarWhenPushed = YES ;
            }
            [self.navigationController pushViewController:_shopCart animated:YES] ;
            break;
        case 2:
            if(_tickets == nil)
            {
                _tickets =  [[YBTicketsViewController alloc]init ] ;
                _tickets.hidesBottomBarWhenPushed  = YES ;
            }
            [self.navigationController pushViewController:_tickets animated:YES] ;
            break;
        case 3:
            if(_personalInformation == nil)
            {
                _personalInformation = [[YBPIMViewController alloc]initWithNibName:@"YBPIMViewController" bundle:nil ] ;
                _personalInformation.hidesBottomBarWhenPushed = YES ;
            }
            [self.navigationController pushViewController: _personalInformation animated:YES] ;
            break;
        default:
            break;
    }
    
    
   // NSLog(@"%f",cell.backGroundView.frame.size.width);
}





//- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER
//{
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
