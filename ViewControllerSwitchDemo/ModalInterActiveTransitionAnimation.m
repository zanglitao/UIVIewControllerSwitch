//
//  ModalInterActiveTransitionAnimation.m
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "ModalInterActiveTransitionAnimation.h"

@interface ModalInterActiveTransitionAnimation()

@property (nonatomic, strong) UIViewController *presentingVC;
@property (nonatomic, assign) BOOL shouldComplete;

@end

@implementation ModalInterActiveTransitionAnimation

- (void)wireToViewController:(UIViewController*)viewController{
    _presentingVC = viewController;
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [viewController.view addGestureRecognizer:gesture];
}

-(CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

-(void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            _interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = translation.y / 400.0;
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            _shouldComplete = (fraction > 0.5);
            
            [self updateInteractiveTransition:fraction];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            _interacting = NO;
            if (!_shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled || [gestureRecognizer velocityInView:gestureRecognizer.view].y < 0 ) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            
            break;
        }
        default:
            break;
    }
}

@end
