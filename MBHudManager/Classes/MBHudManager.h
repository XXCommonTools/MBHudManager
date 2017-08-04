//
//  MBHudManager.h
//  SuperStudy2
//
//  Created by xby on 2017/4/7.
//  Copyright © 2017年 wanxue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNetwork/XXNetworkAnimation.h>


@interface MBHudManager : NSObject<XXNetworkingAnimationAction>

+ (instancetype)sharedManager;

/**
 *  显示信息
 *
 *  @param message 信息
 */
- (void)showMessage:(NSString *)message;
/**
 显示加载遮罩

 @param text 文字
 @param view 显示的视图，如果为nil则显示在window上面
 */
- (void)showLoadingWithText:(NSString *)text inView:(UIView *)view;

/**
 隐藏加载遮罩
 */
- (void)hideLoading;


@end
