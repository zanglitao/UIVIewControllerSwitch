//
//  TabbarControllerDelegate.m
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "TabbarControllerDelegate.h"
#import "TabbarTransitionAnimation.h"

@interface TabbarControllerDelegate()
@property (weak, nonatomic) IBOutlet UITabBarController *tabbarController;
@property(nonatomic,strong)TabbarTransitionAnimation *animation;
@end

@implementation TabbarControllerDelegate

- (void)awakeFromNib {
    _animation = [[TabbarTransitionAnimation alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    
    
    return _animation;
}
@end
