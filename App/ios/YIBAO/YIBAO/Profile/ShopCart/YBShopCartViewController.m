//
//  YBShopCartViewController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBShopCartViewController.h"
#import "YBCouseViewCell.h"

@interface YBShopCartViewController ()<UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *cartItems ;

@end

@implementation YBShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;   // iOS 7 specific
//    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    // Do any additional setup after loading the view from its nib.
    //self.navigationController.tabBarController.tabBar.hidden  = YES ;
    self.cartItemsTable.translatesAutoresizingMaskIntoConstraints = NO;
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:_cartItemsTable attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqualtoItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20.f];
//    
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.cartItemsTable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.navigationController.navigationBar attribute:NSLayoutAttributeBottom multiplier:1 constant:0] ;
  //  [self.view addConstraint:constraint];
    self.cartItemsTable.delegate = self ;
    self.cartItemsTable.dataSource = self ;
    _cartItems = [[NSMutableArray alloc] init ] ;
    [_cartItems  addObject : @[@"class_shengyue", @"声乐" ,@"王尼玛" ,@"新东方"]] ;
    [_cartItems  addObject : @[@"class_shengyue", @"声乐" ,@"张尼玛" ,@"浙大软院"]] ;
    [_cartItems  addObject : @[@"class_shengyue", @"声乐" ,@"曹尼玛" ,@"新东方"]] ;
    [_cartItems  addObject : @[@"class_shengyue", @"声乐" ,@"李尼玛" ,@"新浙大软院"]] ;
    [_cartItems  addObject : @[@"class_shengyue", @"声乐" ,@"吴尼玛" ,@"浙大软院"]] ;

}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.translucent = NO;

}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.translucent = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return _cartItems.count;}

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
    [cell setupCell:_cartItems[indexPath.row][0]:_cartItems[indexPath.row][1]:_cartItems[indexPath.row][2]:_cartItems[indexPath.row][3]];
    [cell showCheckBox:self ];
    return cell;
}


@end
