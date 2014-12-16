//
//  ModalViewController.m
//  ViewControllerSwitchDemo
//
//  Created by 臧 立涛 on 14-12-15.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 130, 200)];
    [self.view addSubview:button];
}

-(void)dismissViewController {
    [self.delegate dismissViewController:self];
}
@end
