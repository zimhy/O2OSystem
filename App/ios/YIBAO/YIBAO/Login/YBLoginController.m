//
//  YBLoginController.m
//  YIBAO
//
//  Created by menghaizhang on 16/1/5.
//  Copyright © 2016年 ZJU. All rights reserved.
//

#import "YBLoginController.h"
#import "YBProfileViewController.h"

@interface YBLoginController ()

@end

@implementation YBLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.frame  ;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:169/255.0 green:176/255.0 blue:211/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:142/255.0 green:151/255.0 blue:201/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:120/255.0 green:131/255.0 blue:193/255.0 alpha:1.0].CGColor,
                       nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
   
    self.view.backgroundColor = [UIColor colorWithRed:164/255.0 green:171/255.0 blue:209/255.0 alpha:1.0] ;
    self.headerIcon.layer.cornerRadius = YBScreenW/8 ;
    self.headerIcon.layer.masksToBounds = YES ;
    self.textFieldBackGround.layer.cornerRadius = 15 ;
    self.mailText.borderStyle = UITextBorderStyleNone ;
    self.pswdText.borderStyle = UITextBorderStyleNone ;
    self.LoginBtn.layer.cornerRadius = 10 ;
    self.LoginBtn.backgroundColor = [UIColor whiteColor] ;
    //self.LoginBtn.
    self.RegisterBtn.backgroundColor = [UIColor colorWithRed:100/255.0 green:114/255.0 blue:184/255.0 alpha:1.0] ;
    self.RegisterBtn.layer.cornerRadius = 10 ;
    self.navigationItem.title = @"登录" ;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

- (IBAction)beginRegister:(id)sender {
    
    [self performSegueWithIdentifier:@"beginRegister" sender:self] ;
}

- (IBAction)BeginLogin:(id)sender {
    YBProfileViewController *profile = [[YBProfileViewController alloc]initWithNibName:@"YBProfileViewController" bundle:nil] ;
    [self.navigationController pushViewController:profile animated:YES] ;
}
@end
