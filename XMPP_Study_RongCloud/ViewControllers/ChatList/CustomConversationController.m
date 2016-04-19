//
//  CustomConversationController.m
//  XMPP_Study_RongCloud
//
//  Created by 陈舒澳 on 16/4/19.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "CustomConversationController.h"

@interface CustomConversationController ()

@end

@implementation CustomConversationController

// 重写一些方法   我们要想保留SDK原有的功能，在这里我们需要调用super
/*----------------------------------------------------消息的点击事件----------------------------------------------------------*/
#pragma mark --- 点击消息cell的数据模型的回调
- (void)didTapMessageCell:(RCMessageModel *)model{
    [super didTapMessageCell:model];
    NSLog(@"点击消息cell的数据模型的回调");
}
#pragma mark --- 长按cell中的消息内容的回调
- (void)didLongTouchMessageCell:(RCMessageModel *)model inView:(UIView *)view{
    [super didLongTouchMessageCell:model inView:view];
    NSLog(@"长按cell中的消息内容的回调");
}
#pragma mark --- 点击cell中URL的回调
- (void)didTapUrlInMessageCell:(NSString *)url model:(RCMessageModel *)model{
    [super didTapUrlInMessageCell:url model:model];
    NSLog(@"点击cell中URL的回调");
}
#pragma mark --- 点击cell中电话号码的回调
- (void)didTapPhoneNumberInMessageCell:(NSString *)phoneNumber model:(RCMessageModel *)model{
    [super didTapPhoneNumberInMessageCell:phoneNumber model:model];
    NSLog(@"点击cell中电话号码的回调");
}
#pragma mark --- 长按cell中的头像的回调
- (void)didLongPressCellPortrait:(NSString *)userId{
    [super didLongPressCellPortrait:userId];
    NSLog(@"长按cell中的头像的回调");
}
/*----------------------------------------------------消息的发送----------------------------------------------------------*/
/**
 *  pushContent是表示当对方离线是要发送的内容
 *
 *
 *
 */
#pragma mark --- 发送消息
- (void)sendMessage:(RCMessageContent *)messageContent pushContent:(NSString *)pushContent{
    [super sendMessage:messageContent pushContent:pushContent];
     NSLog(@"%@---%@",messageContent,pushContent);
}
#pragma mark --- 消息发送失败后的重发
- (void)resendMessage:(RCMessageContent *)messageContent{
    [super resendMessage:messageContent];
}
#pragma mark --- 发送图片消息
- (void)sendImageMessage:(RCImageMessage *)imageMessage pushContent:(NSString *)pushContent{
    [super sendImageMessage:imageMessage pushContent:pushContent];
}
#pragma mark --- 删除消息
- (void)deleteMessage:(RCMessageModel *)model{
    [super deleteMessage:model];
}
#pragma mark --- 插入消息
- (void)appendAndDisplayMessage:(RCMessage *)message{
    [super appendAndDisplayMessage:message];
}
//  如果想在当前会话中手动插入一条消息，需要生成RCMessage对象 如下是生成RCMessage对象
- (void)AddRCMessage{
    //是否保存到本地数据库，如果不保存，则下次进入聊天界面将不再显示。
    BOOL saveToDB = NO;
    
    RCMessage *insertMessage;
    if (saveToDB) {
        // 如果保存到本地数据库，需要调用insertMessage生成消息实体并插入数据库。
//        insertMessage = [[RCIMClient sharedRCIMClient] insertMessage:self.conversationType
//                                                            targetId:self.targetId
//                                                        senderUserId:[RCIM sharedRCIM].currentUserInfo.userId
//                                                          sendStatus:SentStatus_SENT
//                                                             content:warningMessage];
    } else {
        // 如果不保存到本地数据库，需要初始化消息实体并将messageId要设置为－1。
//        insertMessage =[[RCMessage alloc] initWithType:self.conversationType
//                                              targetId:self.targetId
//                                             direction:MessageDirection_SEND
//                                             messageId:-1
//                                               content:warningMessage];
        
    }
    
    // 在当前聊天界面插入该消息
    [self appendAndDisplayMessage:insertMessage];
}
/*----------------------------------------------------消息的发送与显示的回调----------------------------------------------------------*/
#pragma mark --- 准备发送消息的回调
- (RCMessageContent *)willSendMessage:(RCMessageContent *)messageCotent{
     NSLog(@"%@",messageCotent);
    return [super willSendMessage:messageCotent];
}
#pragma mark --- 消息发送完成后的回调
/**
 *  @brief 消息发送完成后的回调
 *
 *  @param stauts        发送状态  0表示成功，非0表示失败
 *  @param messageCotent 消息内容
 */
- (void)didSendMessage:(NSInteger)stauts content:(RCMessageContent *)messageCotent{
    [super didSendMessage:stauts content:messageCotent];
}
#pragma mark --- 即将在聊天界面插入消息的回调
/**
 *  @brief  即将在聊天界面插入消息的回调
 *
 *  @param message 消息实体
 *
 *  @return 可以对消息进行过滤和处理，返回不为nil时，则显示
 */
- (RCMessage *)willAppendAndDisplayMessage:(RCMessage *)message{
    return [super willAppendAndDisplayMessage:message];
}
#pragma mark --- 即将显示消息Cell的回调
/**
 *  @brief  即将显示消息Cell的回调
 *
 *  @param cell      消息cell
 *  @param indexPath 该消息对应的消息cell数据模型在数据源中的索引值
 */
- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    [super willDisplayMessageCell:cell atIndexPath:indexPath];
}
/*----------------------------------------------------未读消息数----------------------------------------------------------*/
/**  导航栏返回按钮中的未读消息数显示    NSArray *displayConversationTypeArray;
 *   右上角的未读消息数提示            BOOL enableUnreadMessageIcon;（进入会话的时候提示上方还有多少消息未读）
 *   进入界面的时候，需要将未读消息数带入会话界面     NSInteger unreadMessageCount;
 *   右下角的未读消息数提示  BOOL enableNewComingMessageIcon;
 */


/*----------------------------------------------------输入工具栏----------------------------------------------------------*/

/**
 *  聊天界面下方的输入工具栏   RCChatSessionInputBarControl *chatSessionInputBarControl;
 *  输入框的默认输入模式      RCChatSessionInputBarInputType defaultInputType;
 *
 *  在聊天的界面上可以初始化工具栏
 *  - (void)setInputBarType:(RCChatSessionInputBarControlType)type style:(RCChatSessionInputBarControlStyle)style;
 * 
 *  表情的输入  定制表情的内容，直接修改Emoji.plist中的内容修改
 *  
 *  扩展输入   聊天界面的 pluginBoardView属性，在viewDidLoad 中自定义扩展输入中的内容，增加、移除、修改扩展的Item
 */




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
  
    
    // Do any additional setup after loading the view.
}

#pragma mark --- 注册键盘通知
- (void)registerKeyBoard{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyBoard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidenKeyBoard:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)showKeyBoard:(NSNotification *)notify{

}
-(void)hidenKeyBoard:(NSNotification *)notify{
    
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
