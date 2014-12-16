//
//  ModalViewController.h
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController;
@protocol ModalViewControllerDelegate <NSObject>

-(void)dismissViewController:(ModalViewController *)mcv;

@end

@interface ModalViewController : UIViewController

@property(nonatomic,weak)id<ModalViewControllerDelegate> delegate;

@end
