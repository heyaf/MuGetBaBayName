//
//  MUDetailsubViewController.m
//  MuGetBaBayName
//
//  Created by mac on 2021/4/27.
//

#import "MUDetailsubViewController.h"

@interface MUDetailsubViewController ()

@end

@implementation MUDetailsubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KWhiteColor;
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kTopHeight+50, kScreenWidth, kScreenWidth/750*310)];
    imageV.image = [UIImage imageNamed:@"myminebg"];
    [self.view addSubview:imageV];
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
