//
//  SJXNetworkTool.m
//  SimulateHttpRequestDataDemo
//
//  Created by sjx on 2017/4/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "SJXNetworkTool.h"
#import "AFNetworking.h"

@implementation SJXNetworkTool

static AFHTTPSessionManager *_manager;

+ (instancetype)share {
    static SJXNetworkTool *_tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
        _tool = [[SJXNetworkTool alloc] init];
    });
    return _tool;
}

- (void)getWithURLString:(NSString *)urlString parameters:(NSMutableDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    // 取消上次网络请求
    [_manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    // 请求参数
    if (!parameters) {
        parameters = [NSMutableDictionary dictionary];
    }
    /*
     在这里拼接公共参数
     */
    [_manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)postWithURLString:(NSString *)urlString parameters:(NSMutableDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    // 取消上次网络请求
    [_manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    // 请求参数
    if (!parameters) {
        parameters = [NSMutableDictionary dictionary];
    }
    /*
     在这里拼接公共参数
     */
    [_manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
