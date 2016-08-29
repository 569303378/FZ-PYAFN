//
//  NetWrokRequestHelper.h
//  ProjectNameB
//
//  Created by lanouhn on 16/4/22.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
//请求类型
//typedef enum {
//    GET,
//    POST
//}requestType;

@interface NetWrokRequestHelper : NSObject
/**
 *  GET请求
 *
 *  @param urlStr       请求链接
 *  @param dic          请求参数
 *  @param succeedBlock 成功回调
 *  @param errorBlock   失败错误
 */
+ (void)requestForGetWhitUrlStr:(NSString *)urlStr parameterDic:(NSMutableDictionary *)dic succeedBlock:(void(^)(id requestObject))succeedBlock errorBlock:(void(^)(NSError *error))errorBlock;

/**
 *  POST请求
 *
 *  @param urlStr       请求链接
 *  @param dic          请求参数
 *  @param succeedBlock 成功回调
 *  @param errorBlock   失败错误
 */
+ (void)requestForPostWhitUrlStr:(NSString *)urlStr parameterDic:(NSMutableDictionary *)dic succeedBlock:(void (^)(id))succeedBlock errorBlock:(void (^)(NSError *))errorBlock;

/*
 说明：可以使用AFN框架中的AFNetworkReachabilityManager来监听网络状态的改变，也可以利用苹果提供的Reachability来监听。建议在开发中直接使用AFN框架处理。
 */
//使用AFN框架来检测网络状态的改变
+ (void)AFNReachability;
@end
