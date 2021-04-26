//
//  MUTabbarVC.m
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//

#import "MUTabbarVC.h"
#import "MUHomeViewController.h"
#import "MUSecViewController.h"
#import "MUFindOtherViewController.h"
#import "MUMineViewController.h"
@interface MUTabbarVC ()<UITabBarControllerDelegate>
@property (nonatomic,strong) UITabBarAppearance *tabBarAppearance;

@end

@implementation MUTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化所有控制器
    [self setUpChildVC];

    

    
    // 设置代理监听tabBar的点击
    self.delegate = self;
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *tabBarAppearance = [[UITabBarAppearance alloc] init];

        NSMutableDictionary<NSAttributedStringKey, id> *selectedAttributes = self.tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes.mutableCopy;
        selectedAttributes[NSForegroundColorAttributeName] = KRedColor;
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes.copy;

        NSMutableDictionary<NSAttributedStringKey, id> *normalAttributes = self.tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes.mutableCopy;
        normalAttributes[NSForegroundColorAttributeName] = KGrayColor;
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes.copy;

        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName : KGrayColor};
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName : KRedColor};
        
        tabBarAppearance.backgroundImage = [UIImage imageWithColor:RGB(255, 255, 255)];
        tabBarAppearance.shadowColor = RGB(237, 237, 237);
        self.tabBar.standardAppearance = tabBarAppearance;

    } else {
        NSMutableDictionary *selectedAttributes = [[NSMutableDictionary alloc] initWithDictionary:[[UITabBarItem appearance] titleTextAttributesForState:UIControlStateSelected]];
        selectedAttributes[NSForegroundColorAttributeName] = KRedColor;

        [[UITabBarItem appearance] setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: KGrayColor} forState:UIControlStateNormal];

        // 2.1 正常状态下的文字
        NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
        normalAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
        normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

        // 2.2 选中状态下的文字
        NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
        selectedAttr[NSForegroundColorAttributeName] = [UIColor redColor];
        selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

        // 2.3 统一设置UITabBarItem的文字属性
        UITabBarItem *item = [UITabBarItem appearance];
        // 2.3.1 设置UITabBarItem的正常状态下的文字属性
        [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
        // 2.3.2 设置UITabBarItem的选中状态下的文字属性
        [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
        self.tabBar.shadowImage = [UIImage imageWithColor:RGB(237, 237, 237)];
        self.tabBar.backgroundImage = [UIImage imageWithColor:KWhiteColor];
    }
}

- (void)setUpChildVC {
    

    [self setChildVC:[MUHomeViewController new] title:@"首页" image:@"secIcon" selectedImage:@"secIcon_sel"];
    [self setChildVC:[MUSecViewController new] title:@"测名" image:@"home" selectedImage:@"home_sel"];
    [self setChildVC:[MUFindOtherViewController new] title:@"发现" image:@"find" selectedImage:@"find_sel"];

    [self setChildVC:[MUMineViewController new] title:@"我的" image:@"mine" selectedImage:@"mine_sel"];
}

- (void)setChildVC:(UIViewController *)childVC title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];

    nav.tabBarItem.title = title;
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName] = kBlackColor;
//    dict[NSFontAttributeName] = [UIFont systemFontOfSize:11];
//
//    NSMutableDictionary *attrSelected = [NSMutableDictionary dictionary];
//    attrSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
//    attrSelected[NSForegroundColorAttributeName] = kBlackColor;
//
//    [nav.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
//    [nav.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];


//    image.accessibilityFrame = CGRectMake(0, 0, 30, 30);
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];

 

}
#pragma mark - 2.设置tabBarItems的文字属性
+ (void)load
{
    // 2.0 设置TabBar的背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setShadowImage:[UIImage new]];
    [tabBarAppearance setBackgroundColor:[UIColor blackColor]];
    tabBarAppearance.translucent = NO;

    // 2.1 正常状态下的文字
    NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

    // 2.2 选中状态下的文字
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:10];

    // 2.3 统一设置UITabBarItem的文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    // 2.3.1 设置UITabBarItem的正常状态下的文字属性
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    // 2.3.2 设置UITabBarItem的选中状态下的文字属性
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
 

    return YES;
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"item name = %@", item.title);
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
}

- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
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
