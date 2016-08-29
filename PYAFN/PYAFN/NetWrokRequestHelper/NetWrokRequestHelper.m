//
//  NetWrokRequestHelper.m
//  ProjectNameB
//
//  Created by lanouhn on 16/4/22.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "NetWrokRequestHelper.h"
#import <AFNetworking.h>
@implementation NetWrokRequestHelper
/**
 *  GET请求
 *
 *  @param urlStr       请求链接
 *  @param dic          请求参数
 *  @param succeedBlock 成功回调
 *  @param errorBlock   失败错误
 */
+ (void)requestForGetWhitUrlStr:(NSString *)urlStr parameterDic:(NSMutableDictionary *)dic succeedBlock:(void(^)(id requestObject))succeedBlock errorBlock:(void(^)(NSError *error))errorBlock {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSString *key in dic) {
        NSString *tempStr = [NSString stringWithFormat:@"%@=%@", key, dic[key]];
        [tempArray addObject:tempStr];
    }
    NSString *paraStr = [tempArray componentsJoinedByString:@"&"];
    NSString *paraURLStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"?%@", paraStr]];
    //创建URL
    NSURL *url = [NSURL URLWithString:paraURLStr];
    //创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //创建全局会话
    NSURLSession *session = [NSURLSession sharedSession];
    //根据全局会话创建请求任务对象
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //如果为空,则请求成功
        if (error == nil) {
            id temp = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            succeedBlock(temp);
            NSLog(@"请求成功");
        } else {
            errorBlock(error);
            NSLog(@"请求失败");
        }
    }];
    //执行
    [task resume];
}

/**
 *  POST请求
 *
 *  @param urlStr       请求链接
 *  @param dic          请求参数
 *  @param succeedBlock 成功回调
 *  @param errorBlock   失败错误
 */
+ (void)requestForPostWhitUrlStr:(NSString *)urlStr parameterDic:(NSMutableDictionary *)dic succeedBlock:(void (^)(id))succeedBlock errorBlock:(void (^)(NSError *))errorBlock {
    //创建URL
    NSURL *url = [NSURL URLWithString:urlStr];
    //创建可变请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if (dic) {
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        request.HTTPMethod = @"POST";
    }
    
    //创建全局会话
    NSURLSession *session = [NSURLSession sharedSession];
    //根据全局会话创建请求任务对象
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //如果为空,则请求成功
        if (error == nil) {
            id temp = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            succeedBlock(temp);
            NSLog(@"请求成功");
        } else {
            errorBlock(error);
            NSLog(@"请求失败"); 
        }
    }];
    //执行
    [task resume];
}

/*
 说明：可以使用AFN框架中的AFNetworkReachabilityManager来监听网络状态的改变，也可以利用苹果提供的Reachability来监听。建议在开发中直接使用AFN框架处理。
 */
//使用AFN框架来检测网络状态的改变
+ (void)AFNReachability
{
    //1.创建网络监听管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    //2.监听网络状态的改变
    /*
     AFNetworkReachabilityStatusUnknown          = 未知
     AFNetworkReachabilityStatusNotReachable     = 没有网络
     AFNetworkReachabilityStatusReachableViaWWAN = 3G
     AFNetworkReachabilityStatusReachableViaWiFi = WIFI
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
                
            default:
                break;
        }
    }];
    
    //3.开始监听
    [manager startMonitoring];
}

#pragma mark = 上传图片至服务器(图片压缩/单张或者多张)
@end
