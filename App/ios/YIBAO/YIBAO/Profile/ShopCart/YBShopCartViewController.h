//
//  YBShopCartViewController.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBShopCartViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UITableView *cartItemsTable;


@end
