//
//  PostService.h
//  HourseManage
//
//  Created by mac on 2019/11/7.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostService : NSObject

//登录
+ (void)startRequestWithUrl:(NSString *)url method:(NSString *) method params:(NSDictionary *)params WithBlock:(void(^)(id responseObject, NSError *error))completion;


//普通
+ (void)AFHTTPSessionManager:(NSString *)url method:(NSString *) method params:(NSDictionary *)params WithBlock:(void(^)(id responseObject, NSError *error))completion;

/******************************************************************************
函数名称 : + (NSData *)dataWithBase64EncodedString:(NSString *)string
函数描述 : base64格式字符串转换为文本数据
输入参数 : (NSString *)string
输出参数 : N/A
返回参数 : (NSData *)
备注信息 :
******************************************************************************/
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;


//
+(id)jwtDecodeWithJwtString:(NSString *)jwtStr;

+(NSString*)DataTOjsonString:(id)object;

@end

NS_ASSUME_NONNULL_END
