//
//  ModalTransitionAnimation.m
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "ModalTransitionAnimation.h"
#import "ModalViewController.h"

@implementation ModalTransitionAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    if ([toVC isKindOfClass:[ModalViewController class]]) {
        toVC.view.frame = CGRectOffset(finalFrame, 0, [UIScreen mainScreen].bounds.size.height);
    } else {
        toVC.view.frame = CGRectOffset(finalFrame, 0, -[UIScreen mainScreen].bounds.size.height);
    }
    
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
