//
//  ChatListController.m
//  XMPP_Study_RongCloud
//
//  Created by 陈舒澳 on 16/4/19.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "ChatListController.h"
#import "CustomConversationController.h"
@interface ChatListController ()

@end

@implementation ChatListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置列表中要显示的会话类型
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION)]];
    //去除没有内容的线条
    self.conversationListTableView.tableFooterView = [UIView new];

}

#pragma mark --- 进入聊天控制器
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath{
    
    //  RCConversationViewController 系统自带的一个聊天控制器
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType =model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    
    //  CustomConversationController 继承 RCConversationViewController，主要是重写一些方法
    /**
     *  targetId 接收消息的用户ID
     *
     *
     */
    CustomConversationController * CustomConversation = [[CustomConversationController alloc] init];
    CustomConversation = [CustomConversation initWithConversationType:model.conversationType targetId:model.targetId];
    
    
     NSLog(@"---%lu---%@---%@",(unsigned long)model.conversationType,model.targetId,model.conversationTitle);
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:CustomConversation animated:YES];
    self.hidesBottomBarWhenPushed = NO;
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
