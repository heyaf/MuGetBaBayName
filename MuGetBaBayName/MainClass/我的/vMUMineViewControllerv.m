
#import "vMUMineViewControllerv.h"
#import "zLZHPersonalCenterViewz.h"
#import "gMUMineDetailVCg.h"
#import <SXAlertView.h>
#import "MUDetailsubViewController.h"
@interface vMUMineViewControllerv ()<DevelopmentImpersonalKernelWatchDesignate>

@end

@implementation vMUMineViewControllerv

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSArray * centerArr = @[@[@"使用说明",@"清除缓存"],@[@"隐私条款",@"关于"],@[@"反馈"]] ;
    zLZHPersonalCenterViewz * pcv = [[zLZHPersonalCenterViewz alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pCenterArrp:centerArr followUsherHeader:YES];
    pcv.delegate = self ;
    
    pcv.expandHalfwayProperlyCapabilities = @[@[@"",@""],@[@"",@"",@""],@[@""]] ;
    [self.view addSubview:pcv];
}

-(void)mDidSelectRowTitlem:(NSString *)title{
    gMUMineDetailVCg *detailVC = [[gMUMineDetailVCg alloc] init];
    detailVC.hidesBottomBarWhenPushed = YES;
    if ([title isEqualToString:@"清除缓存"]) {
        NSString *str = [self getMCacheSizem];
        NSString *infoStr = kStringFormat(@"已清除%@缓存",str);
        [SVProgressHUD showSuccessWithStatus:infoStr];
    }else if ([title isEqualToString:@"使用说明"]){
        MUDetailsubViewController *msgVC = [[MUDetailsubViewController alloc] init];
        msgVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:msgVC animated:YES];
        
    }else if ([title isEqualToString:@"隐私条款"]){
        detailVC.Title = @"隐私条款";
        detailVC.message = @"本应用尊重并保护所有使用服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，本应用会按照本隐私权政策的规定使用和披露您的个人信息。但本应用将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，本应用不会将这些信息对外披露或向第三方提供。本应用会不时更新本隐私权政策。\n\n 适用范围\n(a) 在您注册本应用帐号时，您根据本应用要求提供的个人注册信息；\n(b) 在您使用本应用网络服务，或访问本应用平台网页时，本应用自动接收并记录的您的浏览器和计算机上的信息，包括但不限于您的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据；\n\n请您妥善保护自己的个人信息，仅在必要的情形下向他人提供。如您发现自己的个人信息泄密，尤其是本应用用户名及密码发生泄露，请您立即联络本应用客服，以便本应用采取相应措施。";
        [self.navigationController pushViewController:detailVC animated:YES];
    }else if ([title isEqualToString:@"关于"]){
        detailVC.Title = @"关于";
        detailVC.message = [NSString stringWithFormat:@"%@%@%@%@%@%@",@"本app的功能,完全是由计算机程序自动测算得出,非人工分析,鉴于计算机程序的局限性,本app所有的测试结果不作为您真正人生规划指导,仅做娱乐参考,如果用户使用本产品为参照出现意外,导致身体或财产损害,app",@"开发团",@"队",@"概",@"不负",@"责"];
        [self.navigationController pushViewController:detailVC animated:YES];
       
        
        
    }else if ([title isEqualToString:@"反馈"]){
        detailVC.Title = [NSString stringWithFormat:@"%@%@%@",@"联",@"系客",@"服"];
        detailVC.sHasKefus = @"YES";
        detailVC.message = @"用着不爽？想吐槽我们？或者有好的建议与意见，欢迎联系我们的客服小哥\n我们会尽力解决的哦。\n\n客服微信:ccc666888ooo (ps:请备注好App名称)";
        [self.navigationController pushViewController:detailVC animated:YES];
       
    }
}

-(void)mTapHeaderm{
    NSLog(@"点你个头") ;
}

-(NSString *)getMCacheSizem{
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory , NSUserDomainMask , YES) firstObject];
    
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
    NSString *filePath  = nil;
    NSInteger totleSize = 0;
    
    for (NSString *subPath in subPathArr){
        
        
        filePath =[cachePath stringByAppendingPathComponent:subPath];
        
        BOOL isDirectory = NO;
        
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        
        if (!isExist || isDirectory || [filePath containsString:@".DS"]){
            
            continue;
        }
        
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        
        
        NSInteger size = [dict[[NSString stringWithFormat:@"%@%@%@%@%@",@"NSF",@"i",@"le",@"S",@"ize"]] integerValue];
        
        totleSize += size;
    }
    
    NSString *totleStr = nil;
    if (totleSize > 1000 * 1000){
        totleStr = [NSString stringWithFormat:@"%.2fM",totleSize / 1000.00f /1000.00f];
    }else if (totleSize > 1000){
        totleStr = [NSString stringWithFormat:@"%.2fKB",totleSize / 1000.00f ];
    }else{
        totleStr = [NSString stringWithFormat:@"%.2fB",totleSize / 1.00f];
    }
    return totleStr;
}
@end
