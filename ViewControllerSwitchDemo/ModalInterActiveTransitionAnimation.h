//
//  ModalInterActiveTransitionAnimation.h
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalInterActiveTransitionAnimation : UIPercentDrivenInteractiveTransition

@property(nonatomic,assign)BOOL interacting;
- (void)wireToViewController:(UIViewController*)viewController;


@end