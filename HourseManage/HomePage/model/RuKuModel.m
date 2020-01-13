//
//  RuKuModel.m
//  HourseManage
//
//  Created by mac on 2019/12/26.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "RuKuModel.h"

@implementation RuKuModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {

        self.wdtID = value;

    }
    
}

@end
