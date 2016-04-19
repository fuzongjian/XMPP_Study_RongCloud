//
//  AFNService.h
//  XMPP_Study_RongCloud
//
//  Created by 陈舒澳 on 16/4/19.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^SuccessBlock) (id data);
typedef void(^FailBlock) (id data);

@interface AFNService : NSObject
+ (void)postUrl:(NSString *)url body:(NSDictionary *)dic success:(SuccessBlock)success fail:(FailBlock)fail;
@end
