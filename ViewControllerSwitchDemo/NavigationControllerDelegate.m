//
//  NavagationControllerDelegate.m
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "NavigationTransitionAnimation.h"

@interface NavigationControllerDelegate()

@property (weak, nonatomic) IBOutlet UINavigationController *navigationController;
@property(nonatomic,retain)NavigationTransitionAnimation *animation;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;
@property (nonatomic,assign)BOOL interActiving;
@end

@implementation NavigationControllerDelegate


-(void)awakeFromNib {
    self.animation = [[NavigationTransitionAnimation alloc] init];
    
    self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
    
    [self.navigationController.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)]];
    

}

-(void)handleGesture:(UIPanGestureRecognizer *)gesture {
    UIView* view = self.navigationController.view;
    CGPoint location = [gesture locationInView:gesture.view];
    CGPoint translation = [gesture translationInView:gesture.view];
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            _interActiving = YES;
            if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) {
                [self.navigationController popViewControllerAnimated:YES];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = fabs(translation.x / view.bounds.size.width);
            [_interactionController updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            _interActiving = NO;
            CGFloat fraction = fabs(translation.x / view.bounds.size.width);
            if (fraction < 0.5 || [gesture velocityInView:view].x < 0 || gesture.state == UIGestureRecognizerStateCancelled) {
                [_interactionController cancelInteractiveTransition];
            } else {
                [_interactionController finishInteractiveTransition];
            }
            
            break;
        }
        default:
            break;
    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return _animation;
    }
    
    return nil;
}


- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interActiving ? self.interactionController : nil;
}
@end
