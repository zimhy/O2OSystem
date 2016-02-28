//
//  YBCourseListController.h
//  YIBAO
//
//  Created by menghaizhang on 16/2/27.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SelectionCell.h"
#import "UITableView+DataSourceBlocks.h"
#import "TableViewWithBlock.h"

@interface YBCourseListController : UIViewController
{
    BOOL isOpened;
}
@property (weak, nonatomic) IBOutlet UITableView *courseList;
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (nonatomic) IBOutlet TableViewWithBlock *tb;

@end
