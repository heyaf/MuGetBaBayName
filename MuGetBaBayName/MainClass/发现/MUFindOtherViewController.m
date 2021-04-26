//
//  MUFindOtherViewController.m
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//

#import "MUFindOtherViewController.h"
#import "MUFindUrlVC.h"

@interface MUFindOtherViewController ()



@end

@implementation MUFindOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现更多";

    self.view.backgroundColor = KWhiteColor;
    NSArray *imageArr = @[@"shier",@"qimingyaosu",@"aijiaxing"];
    for (int i =0; i<3; i++) {
        UIButton *btn = [UIButton buttonWithType:0];
        btn.frame = CGRectMake(15, kTopHeight+i*200, kScreenWidth-30, 180);
        
        btn.tag = 500+i;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-30, 180)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:imageArr[i]];
        
        [btn addSubview:imageView];
        
        [self.view addSubview:btn];
        [btn
         addTarget:self action:@selector(btnclicked:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 10;
        
        btn.layer.borderWidth = 3;
        btn.layer.borderColor = [UIColor systemPinkColor].CGColor;
    }
}

-(void)btnclicked:(UIButton *)btn{
    NSArray *urlArr = @[
    @"http://share.aimx777.com/qiming_web/qm_shengxiao/#/index",
    @"http://share.aimx777.com/qiming_web/qm_jiangjiu/#/index",
    @"http://share.aimx777.com/qiming_web/qm_qiyuan/#/index"
    ];
    NSArray *titleArr = @[@"十二生肖",
    @"起名讲究",
    @"姓氏起源"];
    NSInteger tag = btn.tag-500;
    
    MUFindUrlVC *findVC = [[MUFindUrlVC alloc] init];
    findVC.urlStr = urlArr[tag];
    findVC.titleStr = titleArr[tag];
    findVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:findVC animated:YES];
    
}

@end
