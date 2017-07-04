//
//  ZRTabBar.m
//  ZRTabbarController
//
//  Created by ZhongruiXu on 2017/7/4.
//  Copyright © 2017年 Zhongrui. All rights reserved.
//

#import "ZRTabBar.h"

@implementation ZRTabBar
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica Light" size:14], NSFontAttributeName, nil];
        [[UITabBarItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0.0, -13.0)];
        
    }
    return self;
}
@end
