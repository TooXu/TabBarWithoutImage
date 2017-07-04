//
//  ZRTabBarController.m
//  ZRTabbarController
//
//  Created by ZhongruiXu on 2017/7/4.
//  Copyright © 2017年 Zhongrui. All rights reserved.
//

#import "ZRTabBarController.h"
#import "ZRTabBar.h"

#define barItemW [UIScreen mainScreen].bounds.size.width / 4.f

@interface ZRTabBarController () <UITabBarControllerDelegate>
@property (nonatomic, strong) UIView *lineView;

@end

@implementation ZRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
    [self setupChildViewController];
    [self setupLineView];
    
    // 去掉顶部黑线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    self.delegate = self;
}
- (void)setupLineView {
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, barItemW * 0.5, 3)];
    lineView.backgroundColor = [UIColor redColor];
    [self.tabBar addSubview:lineView];
    self.lineView = lineView;
    
    CGPoint center = self.lineView.center;
    center.x = barItemW * 0.5;
    self.lineView.center = center;
}

- (void)setUpTabBar{
    [self setValue:[[ZRTabBar alloc] init] forKey:@"tabBar"];
}

- (void)setupChildViewController {
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc4 = [[UIViewController alloc]init];
    vc4.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:vc1 title:@"控制器1" imageName:nil selectedImage:nil];
    [self addChildViewController:vc2 title:@"控制器2" imageName:nil selectedImage:nil];
    [self addChildViewController:vc3 title:@"控制器3" imageName:nil selectedImage:nil];
    [self addChildViewController:vc4 title:@"控制器4" imageName:nil selectedImage:nil];
}

- (void)addChildViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage {
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.title = title;
    
    UIImage *image = [UIImage imageNamed:selectedImage];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    
    UINavigationController *hbaNav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:hbaNav];
}
#pragma mark - UITabbarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"%zd", tabBarController.selectedIndex);
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint center = self.lineView.center;
        center.x = barItemW * (tabBarController.selectedIndex + 0.5);
        self.lineView.center = center;
    }];
}

@end
