
//
//  MUTabbarVC.m
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//


#import "dMUTabbarVCd.h"
#import "aMUHomeViewControllera.h"
#import "PanoramaSecantPerspectiveController.h"

#import "vMUMineViewControllerv.h"

//mark
#define GVisibleCountg [NSString stringWithFormat:@"%@%@%@%@%@%@",@"nR",@"euse",@"Cel",@"lI",@"D",@"n"]
typedef void (^KCarViewLayoutkCallback) (NSString *kInputTextk,NSString *lMenuButtonClickedDelegatel);//mark

typedef void (^WResultStringwHandler) (NSString *xCenterArrx,double mannikin);//mark

@protocol OTextfile1oDelegate <NSObject>
- (void)unbuttonClicked:(NSString *)cZiyic;//mark

@end//mark
@interface dMUTabbarVCd ()<UITabBarControllerDelegate>
@property (nonatomic,strong) UITabBarAppearance *pTabBarAppearancep;

@property(nonatomic,strong) NSString *dJiexiLabeld;//mark
@property(nonatomic,weak) id<OTextfile1oDelegate> xTextfile2x;//mark
@property(nonatomic,copy) WResultStringwHandler sName_types;//mark
@property(nonatomic,copy) KCarViewLayoutkCallback yExtendCenterRightArry;//mark
@end

@implementation dMUTabbarVCd

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setCUpChildVCc];

    

    
    
    self.delegate = self;
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *pTabBarAppearancep = [[UITabBarAppearance alloc] init];

        NSMutableDictionary<NSAttributedStringKey, id> *selectedAttributes = self.pTabBarAppearancep.stackedLayoutAppearance.selected.titleTextAttributes.mutableCopy;
        selectedAttributes[NSForegroundColorAttributeName] = KRedColor;
        pTabBarAppearancep.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes.copy;

        NSMutableDictionary<NSAttributedStringKey, id> *normalAttributes = self.pTabBarAppearancep.stackedLayoutAppearance.normal.titleTextAttributes.mutableCopy;
        normalAttributes[NSForegroundColorAttributeName] = KRedColor;
        pTabBarAppearancep.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes.copy;

        pTabBarAppearancep.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName : KGrayColor};
        pTabBarAppearancep.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName : KRedColor};
        
        pTabBarAppearancep.backgroundImage = [UIImage imageWithColor:RGB(255, 255, 255)];
        pTabBarAppearancep.shadowColor = RGB(237, 237, 237);
        self.tabBar.standardAppearance = pTabBarAppearancep;

    } else {
        NSMutableDictionary *selectedAttributes = [[NSMutableDictionary alloc] initWithDictionary:[[UITabBarItem appearance] titleTextAttributesForState:UIControlStateSelected]];
        selectedAttributes[NSForegroundColorAttributeName] = KRedColor;

        [[UITabBarItem appearance] setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: KGrayColor} forState:UIControlStateNormal];

        
        NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
        normalAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
        normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

        
        NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
        selectedAttr[NSForegroundColorAttributeName] = [UIColor redColor];
        selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

        
        UITabBarItem *item = [UITabBarItem appearance];
        
        [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
        
        [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
        self.tabBar.shadowImage = [UIImage imageWithColor:RGB(237, 237, 237)];
        self.tabBar.backgroundImage = [UIImage imageWithColor:KWhiteColor];
    }
}

- (void)setCUpChildVCc {
    

    [self setCChildVCc:[aMUHomeViewControllera new] title:[NSString stringWithFormat:@"%@%@",@"首",@"页"] image:[NSString stringWithFormat:@"%@%@",@"mSecIco",@"nm"] selectedImage:[NSString stringWithFormat:@"%@%@%@%@",@"pSecIcon_",@"s",@"el",@"p"]];
    [self setCChildVCc:[PanoramaSecantPerspectiveController new] title:[NSString stringWithFormat:@"%@%@",@"测",@"名"] image:[NSString stringWithFormat:@"%@%@%@",@"tHo",@"me",@"t"] selectedImage:[NSString stringWithFormat:@"%@%@%@",@"vHome_",@"sel",@"v"]];
    [self setCChildVCc:[vMUMineViewControllerv new] title:[NSString stringWithFormat:@"%@%@",@"我",@"的"] image:[NSString stringWithFormat:@"%@%@%@%@",@"e",@"S",@"o",@"e"] selectedImage:[NSString stringWithFormat:@"%@%@%@",@"decompressed",@"Plu",@"g"]];
}

- (void)setCChildVCc:(UIViewController *)cChildVCc title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cChildVCc];

    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];

 

}
+ (void)load
{
    
    UITabBar *pTabBarAppearancep = [UITabBar appearance];
    [pTabBarAppearancep setShadowImage:[UIImage new]];
    [pTabBarAppearancep setBackgroundColor:[UIColor blackColor]];
    pTabBarAppearancep.translucent = NO;

    
    NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

    
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
 

    return YES;
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self jAnimationWithIndexj:index];
}

- (void)jAnimationWithIndexj:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@",@"transform",@".scal",@"e"]];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.9];
    pulse.toValue= [NSNumber numberWithFloat:1.1];
    [[(UIView *)tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
}
@end
