//
//  PostService.m
//  HourseManage
//
//  Created by mac on 2019/11/7.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "PostService.h"
#import "AFNetworking.h"


static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation PostService

+ (void)startRequestWithUrl:(NSString *)url method:(NSString *) method params:(NSDictionary *)params WithBlock:(void(^)(id responseObject, NSError *error))completion{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:url parameters:nil error:nil];

    request.timeoutInterval = 30;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"charset=UTF-8"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
 
    [[manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
      } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
            
            } completionHandler:^(NSURLResponse * _Nonnull response, id _Nullable responseObject, NSError * _Nullable error) {
                if (!error) {
                    
                    NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
                    
//                    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    
                    
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

                    
                    
                    if (completion) completion(dic,nil);
                    
                } else {
                    
                    if (completion) completion(nil,error);
                    
                }
            }] resume];
    
}


+ (void)AFHTTPSessionManager:(NSString *)url method:(NSString *) method params:(NSDictionary *)params WithBlock:(void(^)(id responseObject, NSError *error))completion{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:10];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
    
    NSString * Authorization =[des objectForKey:@"Authorization"];

    [manager.requestSerializer setValue:Authorization forHTTPHeaderField:@"Authorization"];
    
    if ([method isEqualToString:@"POST"]) {
        //post请求
        [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

//            NSLog(@"====%@",JSON);
          if (completion) completion(JSON,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

            if (completion) completion(nil,error);
        }];
    }else if([method isEqualToString:@"GET"]){//GET
        
        [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

                     if (completion) completion(JSON,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) completion(nil,error);
        }];
        
    }else if([method isEqualToString:@"PUT"]){//PUT
        
        [manager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

            if (completion) completion(JSON,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) completion(nil,error);
        }];
        
    }else{//DELETE
        [manager DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

                       if (completion) completion(JSON,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (completion) completion(nil,error);
        }];
        
    }
    
}

+(id)jwtDecodeWithJwtString:(NSString *)jwtStr{

    NSArray * segments = [jwtStr componentsSeparatedByString:@"."];
    NSString * base64String = [segments objectAtIndex:0];
    
    int requiredLength = (int)(4 *ceil((float)[base64String length]/4.0));
    int nbrPaddings = requiredLength - (int)[base64String length];
    if(nbrPaddings > 0){
        NSString * pading = [[NSString string] stringByPaddingToLength:nbrPaddings withString:@"=" startingAtIndex:0];
        base64String = [base64String stringByAppendingString:pading];
    }
    base64String = [base64String stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    NSData * decodeData = [[NSData alloc] initWithBase64EncodedData:base64String options:0];
    NSString * decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    NSDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:[decodeString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    return jsonDict;
}


- (NSString *)dencode:(NSString *)base64String
{
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    return string;
}


//将请求下来的数据字典 解密转成新的字典打印下啦 注： 这里只能解析一维字典
+ (NSDictionary *)DecryptionDictionary:(NSDictionary *)Dict
{
    NSDictionary * dict=@{@"null":@""};
    
    if (Dict.count==0) {
        return dict;
    }
    NSEnumerator *keyEnum = [Dict keyEnumerator];
    id key;
    
    NSMutableArray * KeyArr=[[NSMutableArray alloc]init];
    
    NSMutableArray * VauleArr=[[NSMutableArray alloc]init];
    
    
    while (key = [keyEnum nextObject]) {
        
        
//        NSString * DecryptEncrypt =
//        NSString *DecryptEncrypt = [Encryption AES128Decrypt:[Dict valueForKey:key] withKey:TogetherKey];
//        //将请求下来的\0删除
//        NSString *str = [DecryptEncrypt stringByReplacingOccurrencesOfString:@"\0" withString:@""];
//
//        [KeyArr addObject:key];
//        [VauleArr addObject:str];
        
    }
    
    NSDictionary * Data=[[NSDictionary alloc]initWithObjects:VauleArr forKeys:KeyArr];

    return Data;
    
}

+ (NSData *)dataWithBase64EncodedString:(NSString *)string
{
    if (string == nil)
        [NSException raise:NSInvalidArgumentException format:nil];
    if ([string length] == 0)
        return [NSData data];
      
    static char *decodingTable = NULL;
    if (decodingTable == NULL)
    {
        decodingTable = malloc(256);
        if (decodingTable == NULL)
            return nil;
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++)
            decodingTable[(short)encodingTable[i]] = i;
    }
      
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL)     //  Not an ASCII string!
        return nil;
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL)
        return nil;
    NSUInteger length = 0;
      
    NSUInteger i = 0;
    while (YES)
    {
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++)
        {
            if (characters[i] == '\0')
                break;
            if (isspace(characters[i]) || characters[i] == '=')
                continue;
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
            {
                free(bytes);
                return nil;
            }
        }
          
        if (bufferLength == 0)
            break;
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
        {
            free(bytes);
            return nil;
        }
          
        //  Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2)
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        if (bufferLength > 3)
            bytes[length++] = (buffer[2] << 6) | buffer[3];
    }
      
    bytes = realloc(bytes, length);
    return [NSData dataWithBytesNoCopy:bytes length:length];
}

///**
// 网络请求封装
//
// @param type 请求类型
// @param urlStr URL
// @param parameters 参数
// @param success 与后台交互成功的回调
// @param failure 与后台交互失败的回调
// */
//+ (void)requestWithType:(AFHTTPSessionManagerRequestType)type URLString:(NSString *)urlStr parameters:(id)parameters success:(void (^)(NSURLSessionDataTask * task, id responseObj))success failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", nil];
//    // 设置请求头
//    [manager.requestSerializer setValue:[Management getUniqueDeviceID] forHTTPHeaderField:@"CLIENT"];
//    if ([User sharedSingleton].token) {
//        [manager.requestSerializer setValue:[User sharedSingleton].token forHTTPHeaderField:@"TOKEN"];
//    }
//    // 请求类型
//    if (type == AFHTTPSessionManagerRequestTypeGet) {
//        [manager GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            success(task,responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            failure(task,error);
//        }];
//    }else if(type == AFHTTPSessionManagerRequestTypePost){
//        [manager POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            success(task,responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            failure(task,error);
//        }];
//    }
//}


//编码问题
+(NSString*)DataTOjsonString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
