//
//  BaseViewController.m
//  PYAFN
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
//初始化加载视图
- (MBProgressHUD *)createProgressHUD {
    if (_HUD == nil) {
        self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:self.HUD];
    }
    return _HUD;
}

/** 显示菊花效果 */
- (void)showProgressHUD {
    [self showProgressHUDTitle:nil];
}

/** 隐藏菊花效果 */
- (void)hiddenProgressHUD {
    if (_HUD) {
        [self.HUD removeFromSuperview];
        self.HUD = nil;
    }
}

/** 显示自定义菊花 title */
- (void)showProgressHUDTitle:(NSString *)title {
    
    //调用初始化方法
    [self createProgressHUD];
    
    if (title.length == 0) {
        self.HUD.labelText = @"请稍后";
    } else {
        self.HUD.labelText = title;
    }
    //显示加载视图
    [self.HUD show:YES];
}

/** 几秒后隐藏菊花效果 */
- (void)showProgressHUDTitle:(NSString *)title time:(NSTimeInterval)time {
    [self showProgressHUDTitle:title];
    [self performSelector:@selector(hiddenProgressHUD) withObject:self afterDelay:time];
}
@end
