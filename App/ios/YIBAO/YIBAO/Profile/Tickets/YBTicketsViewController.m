//
//  YBTicketsViewController.m
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBTicketsViewController.h"
#import "YBTicketViewCell.h"

@interface YBTicketsViewController ()
@property NSMutableArray *ticketArray ;

@end

@implementation YBTicketsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的优惠券"  ;
    self.tableView.backgroundColor = [UIColor colorWithRed:221/255.0 green:220/255.0 blue:218/255.0 alpha:1.0] ;
    
    self.tableView.delegate = self ;
    self.tableView.dataSource = self ;
    _ticketArray = [[NSMutableArray alloc] init ] ;
    [_ticketArray  addObject : @[@"class_shengyue", @"声乐" ,@"王尼玛" ,@"新东方",@"123456"] ];
    [_ticketArray  addObject : @[@"class_shengyue", @"声乐" ,@"张尼玛" ,@"浙大软院",@"213123"] ];
    [_ticketArray  addObject : @[@"class_shengyue", @"声乐" ,@"曹尼玛" ,@"新东方",@"4564"]];
    [_ticketArray  addObject : @[@"class_shengyue", @"声乐" ,@"李尼玛" ,@"新浙大软院",@"45134"]] ;
    [_ticketArray  addObject : @[@"class_shengyue", @"声乐" ,@"吴尼玛" ,@"浙大软院",@"12312"] ];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view data source
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
    return _ticketArray.count;}

/**
 3、设置行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0 ;
}
/**
 4、返回指定的 row 的 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. cell标示符，使cell能够重用
    static NSString *YBTicketViewCellID = @"YBTicketViewCell";
    // 2. 从TableView中获取标示符为paperCell的Cell
    YBTicketViewCell *cell = (YBTicketViewCell *)[tableView dequeueReusableCellWithIdentifier:YBTicketViewCellID];
    // 如果 cell = nil , 则表示 tableView 中没有可用的闲置cell
    if(cell == nil){
        // 3. 把 WPaperCell.xib 放入数组中
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YBTicketViewCell" owner:self options:nil] ;
        
        // 获取nib中的第一个对象
        for (id oneObject in nib){
            // 判断获取的对象是否为自定义cell
            if ([oneObject isKindOfClass:[YBTicketViewCell class]]){
                // 4. 修改 cell 对象属性
                cell = [(YBTicketViewCell *)oneObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YBTicketViewCellID];
            }
        }
    }
    // 5. 设置单元格属性
    //TODO
    [cell setupCell:_ticketArray[indexPath.row][0]:_ticketArray[indexPath.row][1]:_ticketArray[indexPath.row][2]:_ticketArray[indexPath.row][3]:_ticketArray[indexPath.row][4]];
    return cell;
}
/**
 5、点击单元格时的处理
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YBTicketViewCell *cell = [tableView cellForRowAtIndexPath:indexPath] ;
    
    //    NSLog(@"%@",cell.courseTypeName.text) ;
    //    NSLog(@"%f",cell.frame.size.height);
    //
    //    NSLog(@"%f",cell.backGroundView.frame.size.width);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
