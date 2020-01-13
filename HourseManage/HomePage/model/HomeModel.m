//
//  HomeModel.m
//  HourseManage
//
//  Created by mac on 2019/11/29.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {

        self.wdtID = value;

    }
    
}

@end
