//
//  BaseViewController.h
//  PYAFN
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface BaseViewController : UIViewController
@property (nonatomic, strong) MBProgressHUD *HUD;

/** 显示菊花效果 */
- (void)showProgressHUD;
/** 隐藏菊花效果 */
- (void)hiddenProgressHUD;

/** 显示自定义菊花 title */
- (void)showProgressHUDTitle:(NSString *)title;

/** 几秒后隐藏菊花效果 */
- (void)showProgressHUDTitle:(NSString *)title time:(NSTimeInterval)time;

@end
