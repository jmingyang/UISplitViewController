//
//  XmlParser.h
//  Network
//
//  Created by lucid on 16/6/10.
//  Copyright © 2016年 lucid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlParser : NSObject

//XMLParser的单例
+ (XmlParser *)sharedXMLParser;
/****
 会员中心部分的网络访问
 *****/
/*登录*/
+(NSMutableArray *)parserLogin:(NSString *)responseXml;
/*忘记密码&修改密码*/
+(NSMutableArray *)parserForgetPwd:(NSString *)responseXml;
+(NSMutableArray *)parserUpdatePwd:(NSString *)responseXml;
/*储值卡信息*/
+(NSMutableArray *)parserCard:(NSString *)responseXml;
/*注册*/
+(NSMutableArray *)parserRegister:(NSString *)responseXml;
/*我的订场*/
+(NSMutableArray *)parserQueryBooking:(NSString *)responseXml;
+(NSMutableArray *)parserDeleteBooking:(NSString *)responseXml;
/*更换图片（头像）*/
+(NSMutableArray *)parserUpdatePhoto:(NSString *)responseXml;
+(NSMutableArray *)parserBindCard:(NSString *)responseXml;
+(NSMutableArray *)parserCancelCard:(NSString *)responseXml;


+(NSMutableDictionary *)parserGuestName:(NSString *)responseXml;//修改订场客人姓名
+(NSMutableDictionary *)parserGuestStatus:(NSString *)responseXml;//修改订场客人身份
/****
 预订界面的网络访问
 *******/
+(NSMutableArray *)parserTimeandPrice:(NSString *)responseXml;//订场时间和价格
+(NSMutableArray *)parserTheFreeTime:(NSString *)responseXml;//空余打位数
+(NSMutableDictionary *)parserIsBooking:(NSString *)responseXml;//请求是否已有订场，确认下单用
+(NSMutableDictionary *)parserBooking:(NSString *)responseXml;//请求订场
+(NSMutableArray *)parserStatusList:(NSString *)responseXml;//客人身份
+(NSMutableArray *)parserStatusListTwo:(NSString *)responseXml;
/****
个人计分部分的网络访问
******/
+(NSMutableDictionary *)parserScoreupLoad:(NSString *)responseXml;//个人打球成绩上传
+(NSMutableDictionary *)parserHistoryScore:(NSString *)responseXml;//个人打球成绩查询
+(NSMutableArray *)parserTee:(NSString *)responseXml;//Tee台名称
+(NSMutableArray *)parserLane:(NSString *)responseXml;//球道名称
/****
 在线前台部分的网络访问
 ******/
+(NSMutableDictionary *)parserNopayBill:(NSString *)responseXml;//未结账账单（今日未结账单）
+(NSMutableDictionary *)parserMyBill:(NSString *)responseXml;//历史账单

/****
 切换账号前退出账号的网络访问
 ******/
+(NSMutableArray *)parserExitCurrentLogin:(NSString *)responseXml;//切换账号前退出账号

/***
 微信支付
****/
+(NSMutableDictionary *)parserWxpayQuery:(NSString *)xmlParser;
/****
 储值卡支付的网络访问
 *******/
+(NSMutableArray *)parserIsPay:(NSString *)responseXml;
+(NSMutableArray *)parserAllCardInfo:(NSString *)responseXml;
+(NSMutableDictionary *)parserCardPayment:(NSString *)responseXml;
+(NSMutableDictionary *)parserCardBookPayment:(NSString *)responseXml;
+(NSMutableDictionary *)parserAccountWxApiPay:(NSString *)responseXml;

/****
 订单失效的网络访问
 *******/
+(NSMutableArray *)parserInvialBooking:(NSString *)responseXml;//设置订单失效

@end
