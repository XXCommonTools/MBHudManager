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
    

    
}
- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    dispatch_after(10, dispatch_get_main_queue(), ^{
        
        [[MBHudManager sharedManager] showLoadingWithText:@"正在加载信息..." inView:self.view];
        
        dispatch_after(20, dispatch_get_main_queue(), ^{
           
            [[MBHudManager sharedManager] showMessage:@"请求成功"];
        });
    });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
