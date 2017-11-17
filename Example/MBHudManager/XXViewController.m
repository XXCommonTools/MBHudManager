//
//  XXViewController.m
//  MBHudManager
//
//  Created by acct<blob>=0xE7BE8AE5AD90 on 07/14/2017.
//  Copyright (c) 2017 acct<blob>=0xE7BE8AE5AD90. All rights reserved.
//

#import "XXViewController.h"
#import <MBHudManager/MBHudManager.h>


@interface XXViewController ()



@end

@implementation XXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"加载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnAction {
    
    [[MBHudManager sharedManager] showLoadingWithText:@"正在加载信息..." inView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[MBHudManager sharedManager] hideLoading];
        [[MBHudManager sharedManager] showMessage:@"请求成功"];
    });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
