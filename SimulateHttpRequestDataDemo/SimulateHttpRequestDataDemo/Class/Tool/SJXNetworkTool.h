//
//  SJXNetworkTool.h
//  SimulateHttpRequestDataDemo
//
//  Created by sjx on 2017/4/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJXNetworkTool : NSObject

+ (instancetype)share;

- (void)getWithURLString:(NSString *)urlString parameters:(NSMutableDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

- (void)postWithURLString:(NSString *)urlString parameters:(NSMutableDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
