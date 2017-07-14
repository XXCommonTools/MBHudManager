//
//  MBHudManager.m
//  SuperStudy2
//
//  Created by xby on 2017/4/7.
//  Copyright © 2017年 wanxue. All rights reserved.
//

#import "MBHudManager.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface MBHudManager ()

@property (strong,nonatomic) MBProgressHUD *hud;

@end

@implementation MBHudManager

static MBHudManager *_instance = nil;
#pragma mark - life cycle
+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc]init];
    });
    
    return _instance;
}

#pragma mark - public

/**
 *  显示信息
 *
 *  @param message 信息
 */
- (void)showMessage:(NSString *)message {

    [self show:message icon:@"" inView:nil];
}
/**
 显示加载遮罩
 
 @param text 文字
 @param view 显示的视图，如果为nil则显示在window上面
 */
- (void)showLoadingWithText:(NSString *)text inView:(UIView *)view {

    if (!view) {
        
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    if (self.hud) {
#ifdef DEBUG
        NSLog(@"当前有正在显示的遮罩，隐藏之前的遮罩");
#endif
        [self hideLoading];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];
    hud.detailsLabel.text = text;
    hud.contentColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    
    self.hud = hud;
}

/**
 隐藏加载遮罩
 */
- (void)hideLoading {

    [self.hud hideAnimated:YES];
    [self.hud removeFromSuperview];
    self.hud = nil;
}
#pragma mark - delegate
#pragma mark - private
/**
 *  显示信息
 *
 *  @param text 信息内容
 *  @param icon 图标
 */
- (void)show:(NSString *)text icon:(NSString *)icon inView:(UIView *)view {
    
    if (!view) {
        
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置hud颜色
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];
    hud.detailsLabel.text = text;
    hud.contentColor = [UIColor whiteColor];
    
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    // 设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 2秒之后再消失
    [hud hideAnimated:YES afterDelay:2.0f];
}
#pragma mark - getters and setters


@end
