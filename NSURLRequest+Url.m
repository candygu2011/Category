//
//  NSURLRequest+Url.m
//  TuanChe
//
//  Created by aven wu on 14-7-11.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "NSURLRequest+Url.h"
#import "TGMD5.h"

@implementation NSURLRequest (Url)


+(NSMutableURLRequest *)requestWithPath:(NSString *)pathUrl params:(NSDictionary *)params
{
    
    //验证  kGetValidateCodeUrl
    //首页  kHomeCodeUrl
    
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@%@",kGetValidateCodeUrl,pathUrl];
    // 拼接参数 遍历params
    NSMutableString *param = [[NSMutableString alloc] init];
    if (params) {
        // 拼接 ？
//        [urlString appendString:@"?"];
        // 拼接字典
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"%@=%@",key,obj);
            [param appendFormat:@"&%@=%@",key,obj];
        }];
        
    }
    NSLog(@"param:%@",param);
    NSData *data = [param dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:[TGMD5 md5url:urlString]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:40];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    
    [request setValue:[NSString stringWithFormat:@"%ld",(unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: @"sessionCookies"]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in cookies){
        [cookieStorage setCookie: cookie];
    }
    
    return request;
}

+(NSURLRequest *)requestHomeWithPath:(NSString *)pathUrl params:(NSDictionary *)params
{
    
    // [NSURLRequest requestWithURL:<#(NSURL *)#> cachePolicy:<#(NSURLRequestCachePolicy)#> timeoutInterval:<#(NSTimeInterval)#>]
    
    //验证  kGetValidateCodeUrl
    //首页  kHomeCodeUrl
    
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@%@",kHomeCodeUrl,pathUrl];
    // 拼接参数 遍历params
    NSMutableString *param = [[NSMutableString alloc] init];
    if (params) {
        // 拼接 ？
        [urlString appendString:@"?"];
        // 拼接字典
        __block BOOL isFirstParam = YES;
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"%@=%@",key,obj);
            if (isFirstParam) {
                [param appendFormat:@"%@=%@",key,obj];
                isFirstParam = NO;
            }else{
                [param appendFormat:@"&%@=%@",key,obj];
            }
            
            
            
        }];
        
        
        
        
    }
    NSLog(@"param:%@",param);
    NSData *data = [param dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:[TGMD5 md5url:urlString]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    [request setValue:[NSString stringWithFormat:@"%d",[data length]] forHTTPHeaderField:@"Content-Length"];
    return request;
}



@end
