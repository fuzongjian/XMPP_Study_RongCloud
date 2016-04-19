//
//  AFNService.m
//  XMPP_Study_RongCloud
//
//  Created by 陈舒澳 on 16/4/19.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "AFNService.h"

@implementation AFNService
+ (void)postUrl:(NSString *)url body:(NSDictionary *)dic success:(SuccessBlock)success fail:(FailBlock)fail{
    AFHTTPSessionManager * manger = [self getManager:url body:dic];
    [manger POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
+(AFHTTPSessionManager *)getManager:(NSString *)path body:(NSDictionary *)dic{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    manager.requestSerializer= [AFJSONRequestSerializer serializer];
    
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
  
    if ([path isEqualToString:PATH_TOKEN]) {
        [manager.requestSerializer setValue:App_Key forHTTPHeaderField:@"App-Key"];
        [manager.requestSerializer setValue:[dic objectForKey:@"nonce"] forHTTPHeaderField:@"Nonce"];
        [manager.requestSerializer setValue:[dic objectForKey:@"timestamp"] forHTTPHeaderField:@"Timestamp"];
        [manager.requestSerializer setValue:[dic objectForKey:@"Signature"] forHTTPHeaderField:@"Signature"];
        [manager.requestSerializer setValue:App_Secret forHTTPHeaderField:@"appSecret"];
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    }
    return manager;
}
@end
