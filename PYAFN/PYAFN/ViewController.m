//
//  ViewController.m
//  PYAFN
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "NetWrokRequestHelper.h"
//#import "MBProgressHUDHelper.h"
#import "RootViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //get数据请求
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];

    [dic setValue:@"K3VBZ-M6WWV-PPSPY-UVGGC-DRM2Z-PGBMV" forKey:@"key"];
    
//    http://apis.map.qq.com/ws/district/v1/list?key=K3VBZ-M6WWV-PPSPY-UVGGC-DRM2Z-PGBMV
    [NetWrokRequestHelper requestForGetWhitUrlStr:@"http://apis.map.qq.com/ws/district/v1/list" parameterDic:dic succeedBlock:^(id requestObject) {
        
        
    } errorBlock:^(NSError *error) {
        
    }];
    
    //调用网络监管
    [NetWrokRequestHelper AFNReachability];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"风火轮" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(button) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
}
- (void)button {
    RootViewController *rootVC = [[RootViewController alloc] init];
    [self presentViewController:rootVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
