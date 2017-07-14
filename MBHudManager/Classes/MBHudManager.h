//
//  MBHudManager.h
//  SuperStudy2
//
//  Created by xby on 2017/4/7.
//  Copyright © 2017年 wanxue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBHudManager : NSObject

+ (instancetype)sharedManager;

/**
 *  显示信息
 *
 *  @param message 信息
 */
- (void)showMessage:(NSString *)message;
/**
 在view上显示遮罩信息
 
 @param waitMessage 遮罩信息
 @param view 显示的视图 如果为nil则显示在window上面
 */
- (void)showWait:(NSString *)waitMessage inView:(UIView *)view;
/**
 隐藏遮罩
 */
- (void)hideWait;


@end
