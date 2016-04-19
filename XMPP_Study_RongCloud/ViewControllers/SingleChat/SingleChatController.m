//
//  SingleChatController.m
//  XMPP_Study_RongCloud
//
//  Created by 陈舒澳 on 16/4/19.
//  Copyright © 2016年 speeda. All rights reserved.
//

//userId  XMPP_Study_RongyCloud
//name    fuzongjian
// portraitUrl http://upload.jianshu.io/users/upload_avatars/1782036/88529eda1528.jpg?imageMogr/thumbnail/90x90/quality/100


//userid XMMP_Study_RongCloud
//name fuzongyang
//token ZLn8/VK9Wo9OxpOxiVjjSs0BXpLT6v27D3WmzD9EaZ0slBrWzR5DG9uPebjV3YLJrSMS5Um+KoYGkqcE4pDvu8ECpEe3VwqF1fOOOKmDHMk=

#import "SingleChatController.h"

@interface SingleChatController ()<RCIMUserInfoDataSource>

@end

@implementation SingleChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loginState];
}
- (void)loginState{
    [[RCIM sharedRCIM] connectWithToken:App_Token success:^(NSString *userId) {
         NSLog(@"%@",userId);
        //获取用户的详细信息
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
    } error:^(RCConnectErrorCode status) {
        
    } tokenIncorrect:^{
        
    }];
}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo * userInfo))completion{
     NSLog(@"%@---",userId);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
