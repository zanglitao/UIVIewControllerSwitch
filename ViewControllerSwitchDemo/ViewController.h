//
//  ViewController.h
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-14.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

//如果需要使用自定义动画，视图需要实现UIViewControllerTransitioningDelegate协议
@interface ViewController : UIViewController<ModalViewControllerDelegate,UIViewControllerTransitioningDelegate>

@end

