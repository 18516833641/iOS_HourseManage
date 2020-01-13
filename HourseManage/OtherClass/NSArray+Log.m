//
//  NSArray+Log.m
//  Transportation
//
//  Created by 张洁庭 on 17/4/19.
//  Copyright © 2017年 DalianHuaXin. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n",obj];
    }];
    
    [strM appendString:@")\n"];
    
    
    
    
    
    
    return strM;
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t\"%@\" = %@,\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}


@end


