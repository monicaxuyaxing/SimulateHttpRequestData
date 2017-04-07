//
//  NSObject+SJXExtension.m
//  SimulateHttpRequestDataDemo
//
//  Created by sjx on 2017/4/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "NSObject+SJXExtension.h"

@implementation NSObject (SJXExtension)

- (NSString *)sjx_jsonString
{
    if (!self) return nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
