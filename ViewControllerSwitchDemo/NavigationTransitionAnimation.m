//
//  NavigationTransitionAnimation.m
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "NavigationTransitionAnimation.h"

@implementation NavigationTransitionAnimation


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:toVC.view];
    [toVC.view setAlpha:0];
    toVC.view.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0), 0.1, 0.1);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0), 0.1, 0.1);
        fromVC.view.alpha = 0;

        toVC.view.transform = CGAffineTransformIdentity;
        toVC.view.alpha = 1;
 
    } completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        fromVC.view.alpha = 1;
        
        toVC.view.transform = CGAffineTransformIdentity;
        toVC.view.alpha = 1;
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
