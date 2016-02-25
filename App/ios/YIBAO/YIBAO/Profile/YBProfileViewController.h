//
//  YBProfileViewController.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/24.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "ViewController.h"

@interface YBProfileViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headerIconView;
@property (weak, nonatomic) IBOutlet UIView *headerBackGroundView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLB;
@property (weak, nonatomic) IBOutlet UITableView *profileTables;


@end
