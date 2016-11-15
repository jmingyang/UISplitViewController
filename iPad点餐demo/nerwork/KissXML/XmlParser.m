//
//  XmlParser.m
//  Network
//
//  Created by lucid on 16/6/10.
//  Copyright © 2016年 lucid. All rights reserved.
//

#import "XmlParser.h"
#import "DDXMLDocument.h"
#import "DDXMLElement.h"
#import "DDXMLNode.h"
@implementation XmlParser


static XmlParser *xmlParser_ = nil;

/*
 <summary>
 <function>XMLParser的单例</function>
 <date>2012-10-18</date>
 </summary>
 */

+ (XmlParser *)sharedXMLParser
{
    if (!xmlParser_) {
        xmlParser_ = [[XmlParser alloc] init]; //xmlParser_对象不存在时，进行初始化
    }
    return xmlParser_;
}


+(NSMutableArray *)parserLogin:(NSString *)responseXml
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    
    DDXMLElement *note = [doc rootElement];
    
    DDXMLElement *res = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *message = [[note elementsForName:@"Message"] lastObject];
    DDXMLElement *memberid = [[note elementsForName:@"MemberIDCard"] lastObject];
    DDXMLElement *memname = [[note elementsForName:@"UserName"] lastObject];
    DDXMLElement *phone = [[note elementsForName:@"Telephone"] lastObject];
    DDXMLElement *sex = [[note elementsForName:@"Sex"] lastObject];
    DDXMLElement *expiredata = [[note elementsForName:@"Identify"] lastObject];
    DDXMLElement *isMember = [[note elementsForName:@"IsMember"] lastObject];
    DDXMLElement *identifyMemo = [[note elementsForName:@"IdentifyMemo"] lastObject];
    DDXMLElement *courseCode = [[note elementsForName:@"CourseCode"] lastObject];
    DDXMLElement *photo = [[note elementsForName:@"Photo"] lastObject];
    DDXMLElement *IsPay = [[note elementsForName:@"IsPay"] lastObject];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (res) {
        NSString *str = [res stringValue];
        [arr addObject:str];
    }
    if (message) {
        NSString *str1 = [message stringValue];
        [arr addObject:str1];
    }
    if (memberid) {
        NSString *str2 = [memberid stringValue];
        [arr addObject:str2];
    }
    if (memname) {
        NSString *str3 = [memname stringValue];
        [arr addObject:str3];
        //        [userDefaults setObject:str3 forKey:@"MEMBERNAME"];
        [userDefaults synchronize];
    }
    if (sex) {
        NSString *str4 = [sex stringValue];
        [arr addObject:str4];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //        [userDefaults setObject:str4 forKey:@"SEX"];
        [userDefaults synchronize];
    }
    if (phone) {
        NSString *str5 = [phone stringValue];
        [arr addObject:str5];
        //        [userDefaults setObject:str5 forKey:@"USERNAME"];
        [userDefaults synchronize];
    }
    if (expiredata) {
        NSString *str6 = [expiredata stringValue];
        [arr addObject:str6];
    }
    if (isMember) {
        NSString *str7 = [isMember stringValue];
        [arr addObject:str7];
    }
    if (identifyMemo) {
        NSString *str8 = [identifyMemo stringValue];
        //        [userDefaults setObject:str7 forKey:@"IDENTIFY"];
        [arr addObject:str8];
    }
    if (courseCode) {
        NSString *str9 = [courseCode stringValue];
        [arr addObject:str9];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //        [userDefaults setObject:str8 forKey:@"COURSECODE"];
        [userDefaults synchronize];
    }
    if (photo) {
        NSString *str10 = [photo stringValue];
        //        [userDefaults setObject:str9 forKey:@"PHOTO"];
        [arr addObject:str10];
    }
    if (IsPay) {
        NSString *str11 = [IsPay stringValue];
        [arr addObject:str11];
    }
    //    [userDefaults setObject:pwdTF.text forKey:PASSWORD];
    //    [userDefaults synchronize];
    return arr;
}

+(NSMutableDictionary *)parserCardBookPayment:(NSString *)responseXml{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    
    DDXMLElement *note = [doc rootElement];
    
    DDXMLElement *Result = [[note elementsForName:@"Result"] lastObject];
    DDXMLElement *Message = [[note elementsForName:@"Message"] lastObject];
    DDXMLElement *Method = [[note elementsForName:@"Method"] lastObject];
    DDXMLElement *BookCode = [[note elementsForName:@"BookCode"] lastObject];
    
    if (Result) {
        NSString *str1 = [Result stringValue];
        [dic setValue:str1 forKey:@"Result"];
    }
    if (Message) {
        NSString *str2 = [Message stringValue];
        [dic setValue:str2 forKey:@"Message"];
    }
    if (Method) {
        NSString *str3 = [Method stringValue];
        [dic setValue:str3 forKey:@"Method"];
    }
    if (BookCode) {
        NSString *str4 = [BookCode stringValue];
        [dic setValue:str4 forKey:@"BookCode"];
    }
    
    return dic;
}

+(NSMutableArray *)parserExitCurrentLogin:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *res = [[note elementsForName:@"Result"]lastObject];
    DDXMLElement *mess = [[note elementsForName:@"Message"]lastObject];
    if (res) {
        NSString *str = [res stringValue];
        [arr addObject:str];
    }
    if (mess) {
        NSString *str1 = [mess stringValue];
        [arr addObject:str1];
    }
    return arr;
}

+(NSMutableArray *)parserForgetPwd:(NSString *)responseXml
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *res = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *mes = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (res) {
        NSString *strs = [res stringValue];
        [arr addObject:strs];
    }
    if (mes) {
        NSString *str1 = [mes stringValue];
        [arr addObject:str1];
    }
    return arr;
}

+(NSMutableArray *)parserRegister:(NSString *)responseXml{
    
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    
    DDXMLElement *note = [doc rootElement];
    
    DDXMLElement *result = [[note elementsForName:@"Result"]objectAtIndex:0];
    DDXMLElement *message = [[note elementsForName:@"Message"]objectAtIndex:0];
    
    if (result) {
        NSString *str1 = [result stringValue];
        [resArr addObject:str1];
    }
    
    if (message) {
        NSString *str2 = [message stringValue];
        [resArr addObject:str2];
    }
    
    return resArr;
}

+(NSMutableArray *)parserQueryBooking:(NSString *)responseXml{
    
    NSMutableArray *many = [[NSMutableArray alloc] init];
    
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    
    DDXMLElement *note = [doc rootElement];
    
    NSArray *detailList = [note elementsForName:@"DetailInfo"];
    
    for (DDXMLElement *item in detailList) {
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        
        DDXMLElement *result = [[item elementsForName:@"Result"] lastObject];
        DDXMLElement *message = [[item elementsForName:@"Message"] lastObject];
        DDXMLElement *bookCode = [[item elementsForName:@"BookCode"] lastObject];
        DDXMLElement *orderDate = [[item elementsForName:@"OrderDate"] lastObject];
        DDXMLElement *playDate = [[item elementsForName:@"PlayDate"] lastObject];
        DDXMLElement *playTime = [[item elementsForName:@"PlayTime"] lastObject];
        DDXMLElement *changci = [[item elementsForName:@"Changci"] lastObject];
        DDXMLElement *playNum = [[item elementsForName:@"PlayNum"] lastObject];
        DDXMLElement *players = [[item elementsForName:@"Players"] lastObject];
        DDXMLElement *playersIden = [[item elementsForName:@"PlayersIden"] lastObject];
        DDXMLElement *note = [[item elementsForName:@"Note"] lastObject];
        if (result) {
            NSString *str = [result stringValue];
            [dic setValue:str forKey:@"result"];
        }
        if (message) {
            NSString *str1 = [message stringValue];
            [dic setValue:str1 forKey:@"message"];
        }
        if (bookCode) {
            NSString *str2 = [bookCode stringValue];
            [dic setValue:str2 forKey:@"bookCode"];
        }
        if (orderDate) {
            NSString *str3 = [orderDate stringValue];
            [dic setValue:str3 forKey:@"orderDate"];
        }
        if (playDate) {
            NSString *str4 = [playDate stringValue];
            [dic setValue:str4 forKey:@"playDate"];
        }
        if (playTime) {
            NSString *str5 = [playTime stringValue];
            [dic setValue:str5 forKey:@"playTime"];
        }
        if (changci) {
            NSString *str6 = [changci stringValue];
            [dic setValue:str6 forKey:@"changci"];
        }
        if (playNum) {
            NSString *str9 = [playNum stringValue];
            [dic setValue:str9 forKey:@"playNum"];
        }
        if (players) {
            NSString *str10 = [players stringValue];
            [dic setValue:str10 forKey:@"players"];
        }
        if (playersIden) {
            NSString *str11 = [playersIden stringValue];
            [dic setValue:str11 forKey:@"PlayersIden"];
        }
        if (note) {
            NSString *str12 = [note stringValue];
            [dic setValue:str12 forKey:@"note"];
        }
        [many addObject:dic];
    }
    
    return many;
}

+(NSMutableArray *)parserInvialBooking:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *res = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *mes = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (res) {
        NSString *strs = [res stringValue];
        [arr addObject:strs];
    }
    if (mes) {
        NSString *str1 = [mes stringValue];
        [arr addObject:str1];
    }
    return arr;
}

+(NSMutableArray *)parserDeleteBooking:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *res = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *mes = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (res) {
        NSString *strs = [res stringValue];
        [arr addObject:strs];
    }
    if (mes) {
        NSString *str1 = [mes stringValue];
        [arr addObject:str1];
    }
    NSLog(@" arr== %@ ",arr);
    return arr;
}


+(NSMutableArray *)parserUpdatePwd:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *res = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *mes = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (res) {
        NSString *str = [res stringValue];
        [arr addObject:str];
    }
    if (mes) {
        NSString *str1 = [mes stringValue];
        [arr addObject:str1];
    }
    return arr;
}

+(NSMutableArray *)parserCancelCard:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *res = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *mes = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (res) {
        NSString *strs = [res stringValue];
        [arr addObject:strs];
    }
    if (mes) {
        NSString *str1 = [mes stringValue];
        [arr addObject:str1];
    }
    return arr;
}

+(NSMutableArray *)parserBindCard:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *res = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *mes = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (res) {
        NSString *strs = [res stringValue];
        [arr addObject:strs];
    }
    if (mes) {
        NSString *str1 = [mes stringValue];
        [arr addObject:str1];
    }
    return arr;
}

+(NSMutableArray *)parserCard:(NSString *)responseXml{
    
    NSMutableArray *cardArr = [[NSMutableArray alloc]init];
    
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    
    NSArray *cardList = [note elementsForName:@"Cards"];
    
    for (DDXMLElement *item in cardList) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        DDXMLElement *cardCode = [[item elementsForName:@"CardCode"]lastObject];
        if (cardCode) {
            NSString *strs1 = [cardCode stringValue];
            [dic setObject:strs1 forKey:@"consumeBill"];
        }
        
        DDXMLElement *cardCount = [[item elementsForName:@"Remainder"]lastObject];
        if (cardCount) {
            NSString *strs2 = [cardCount stringValue];
            [dic setObject:strs2 forKey:@"cardRemainNum"];
        }
        
        NSArray *bills = [item elementsForName:@"CardBills"];
        
        for (DDXMLElement *bill in bills) {
            NSArray *billl = [bill elementsForName:@"CardBill"];
            NSMutableArray *detailArr = [[NSMutableArray alloc] init];
            for (DDXMLElement *detail in billl){
                NSMutableDictionary *detailDic = [[NSMutableDictionary alloc]init];
                DDXMLElement *time = [[detail elementsForName:@"ConsumeTime"] lastObject];
                DDXMLElement *week = [[detail elementsForName:@"ConsumeWeek"]lastObject];
                DDXMLElement *price = [[detail elementsForName:@"ConsumePrice"]lastObject];
                DDXMLElement *remine = [[detail elementsForName:@"ConsumeBalance"]lastObject];
                if (time) {
                    NSString *str1 = [time stringValue];
                    [detailDic setValue:str1 forKey:@"cardTime"];
                }
                if (week) {
                    NSString *str2 = [week stringValue];
                    [detailDic setValue:str2 forKey:@"cardWeek"];
                }
                if (price) {
                    NSString *str3 = [price stringValue];
                    [detailDic setValue:str3 forKey:@"cardPrice"];
                }
                if (remine) {
                    NSString *str4 = [remine stringValue];
                    [detailDic setValue:str4 forKey:@"cardRemain"];
                }
                [detailArr addObject:detailDic];
            }
            [dic setObject:detailArr forKey:@"consumeBills"];
        }
        [cardArr addObject:dic];
    }
    return cardArr;
}



+(NSMutableArray *)parserUpdatePhoto:(NSString *)responseXml{
    NSMutableArray *photo = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *mess = [[root elementsForName:@"Message"] lastObject];
    if (result) {
        NSString *str = [result stringValue];
        [photo addObject:str];
    }
    if (mess) {
        NSString *message = [mess stringValue];
        [photo addObject:message];
    }
    return photo;
}

//解析打球时间和价格
+(NSMutableArray *)parserTimeandPrice:(NSString *)responseXml
{
    NSMutableArray *TimeandPrice = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    NSArray *Items = [root elementsForName:@"TheFreeTime"];//获取根节点项Item
    for (DDXMLElement *item in Items)
    {
        NSMutableDictionary *oneday = [[NSMutableDictionary alloc] init];
        DDXMLElement *date = [[item elementsForName:@"PlayDate"] lastObject];
        DDXMLElement *price = [[item elementsForName:@"Price"] lastObject];
        
        if (date) {
            [oneday setObject:[date stringValue] forKey:@"PlayDate"];
        }else{
            [oneday setObject:@"" forKey:@"PlayDate"];
        }
        
        if (price) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [oneday setObject:[price stringValue] forKey:@"Price"];
        }else{
            [oneday setObject:@"" forKey:@"Price"];
        }
        [TimeandPrice addObject:oneday];
    }
    return TimeandPrice;
}

//空余打位数
+(NSMutableArray *)parserTheFreeTime:(NSString *)responseXml
{
    NSMutableArray *FreeTimearr = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    NSArray *Items = [root elementsForName:@"TheFreeTime"];//获取根节点项Item
    for (DDXMLElement *item in Items)
    {
        NSMutableDictionary *onetime = [[NSMutableDictionary alloc] init];
        DDXMLElement *teetime = [[item elementsForName:@"TeeTime"] lastObject];
        DDXMLElement *qiuwei = [[item elementsForName:@"FreeToPlay"] lastObject];
        DDXMLElement *groupid = [[item elementsForName:@"GroupID"] lastObject];
        DDXMLElement *price = [[item elementsForName:@"Price"] lastObject];
        
        if (teetime) {
            [onetime setObject:[teetime stringValue] forKey:@"TeeTime"];
        }else{
            [onetime setObject:@"" forKey:@"TeeTime"];
        }
        
        if (qiuwei) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [onetime setObject:[qiuwei stringValue] forKey:@"FreeToPlay"];
        }else{
            [onetime setObject:@"" forKey:@"FreeToPlay"];
        }
        
        if (groupid) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [onetime setObject:[groupid stringValue] forKey:@"GroupID"];
        }else{
            [onetime setObject:@"" forKey:@"GroupID"];
        }
        
        if (price) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [onetime setObject:[price stringValue] forKey:@"Price"];
        }else{
            [onetime setObject:@"" forKey:@"Price"];
        }
        [FreeTimearr addObject:onetime];
    }
    return FreeTimearr;
}

//修改订场客人姓名
+(NSMutableDictionary *)parserGuestName:(NSString *)responseXml
{
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[result stringValue] forKey:@"Result"];
    [dic setObject:[message stringValue] forKey:@"Message"];
    
    return dic;
}

//修改订场客人身份
+(NSMutableDictionary *)parserGuestStatus:(NSString *)responseXml
{
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[result stringValue] forKey:@"Result"];
    [dic setObject:[message stringValue] forKey:@"Message"];
    
    return dic;
}

//请求是否已有订场，确认下单用
+(NSMutableDictionary *)parserIsBooking:(NSString *)responseXml
{
    //    NSMutableArray *FreeTimearr = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];

    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[result stringValue] forKey:@"Result"];
    [dic setObject:[message stringValue] forKey:@"Message"];
    
    
    return dic;
}

//请求订场
+(NSMutableDictionary *)parserBooking:(NSString *)responseXml
{
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];
    DDXMLElement *bookcode = [[root elementsForName:@"BookCode"] lastObject];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[result stringValue] forKey:@"Result"];
    [dic setObject:[message stringValue] forKey:@"Message"];
    if (bookcode) {
        //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
        [dic setObject:[bookcode stringValue] forKey:@"BookCode"];
    }else{
        [dic setObject:@"" forKey:@"BookCode"];
    }
    return dic;
}
//客人身份
+(NSMutableArray *)parserStatusList:(NSString *)responseXml{
    NSMutableArray *GuestStatuearr = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
//    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
//    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];
    
    NSArray *Items = [root elementsForName:@"Status"];
    for (DDXMLElement *item in Items)
    {
        NSMutableDictionary *onestatus = [[NSMutableDictionary alloc] init];
        DDXMLElement *iCode = [[item elementsForName:@"ICode"] lastObject];
        DDXMLElement *statusName = [[item elementsForName:@"StatusName"] lastObject];
        
        
        if (iCode) {
            [onestatus setObject:[iCode stringValue] forKey:@"ICode"];
        }else{
            [onestatus setObject:@"" forKey:@"ICode"];
        }
        
        if (statusName) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [onestatus setObject:[statusName stringValue] forKey:@"StatusName"];
        }else{
            [onestatus setObject:@"" forKey:@"StatusName"];
        }
        
        [GuestStatuearr addObject:onestatus];
    }
    return GuestStatuearr;
}

+(NSMutableArray *)parserStatusListTwo:(NSString *)responseXml{
    NSMutableArray *GuestStatuearr = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    NSArray *Items = [root elementsForName:@"Status"];
    for (DDXMLElement *item in Items)
    {
        NSMutableDictionary *onestatus = [[NSMutableDictionary alloc] init];
        DDXMLElement *iCode = [[item elementsForName:@"ICode"] lastObject];
        DDXMLElement *statusName = [[item elementsForName:@"StatusName"] lastObject];

        [onestatus setObject:[statusName stringValue] forKey:[iCode stringValue]];
        
        if (iCode) {
            [onestatus setObject:[iCode stringValue] forKey:@"ICode"];
        }else{
            [onestatus setObject:@"" forKey:@"ICode"];
        }
        
        
        [GuestStatuearr addObject:onestatus];
    }
    return GuestStatuearr;
    
    
    
}


//未结账账单（今日未结账单）
+(NSMutableDictionary *)parserNopayBill:(NSString *)responseXml
{
    NSMutableDictionary *allinfodic = [[NSMutableDictionary alloc]init];
    NSMutableArray *Todaybillarr = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *Root = [doc rootElement];
    //DDXMLElement *Root = [[root elementsForName:@"Root"] lastObject];
    DDXMLElement *result = [[Root elementsForName:@"Result"] lastObject];
    [allinfodic setObject:[result stringValue] forKey:@"Result"];
    DDXMLElement *message = [[Root elementsForName:@"Message"] lastObject];
    [allinfodic setObject:[message stringValue] forKey:@"Message"];
    DDXMLElement *bookcode = [[Root elementsForName:@"BookCode"] lastObject];
    if (bookcode) {
        NSString *str = [bookcode stringValue];
        [allinfodic setObject:str forKey:@"BookCode"];
    }
    DDXMLElement *consumer = [[Root elementsForName:@"ConsumeID"] lastObject];
    if (consumer) {
        NSString *str = [consumer stringValue];
        [allinfodic setObject:str forKey:@"consumerId"];
    }
    
    DDXMLElement *bill = [[Root elementsForName:@"Bill"] lastObject];//获取根节点项Item
    NSArray *Items = [bill elementsForName:@"BillList"];
    for (DDXMLElement *item in Items)
    {
        NSMutableDictionary *oneplacebill = [[NSMutableDictionary alloc] init];
        DDXMLElement *place = [[item elementsForName:@"Place"] lastObject];
        DDXMLElement *summoney = [[item elementsForName:@"SumMoney"] lastObject];
        DDXMLElement *playdate = [[item elementsForName:@"PlayDate"] lastObject];
        if (place) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [oneplacebill setObject:[place stringValue] forKey:@"Place"];
        }else{
            [oneplacebill setObject:@"" forKey:@"Place"];
        }
        if (summoney) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [oneplacebill setObject:[summoney stringValue] forKey:@"SumMoney"];
        }else{
            [oneplacebill setObject:@"" forKey:@"SumMoney"];
        }
        if (playdate) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [oneplacebill setObject:[playdate stringValue] forKey:@"PlayDate"];
        }else{
            [oneplacebill setObject:@"" forKey:@"PlayDate"];
        }
        NSMutableArray *allbillitems = [[NSMutableArray alloc] init];
        NSArray *billItems = [item elementsForName:@"BillItem"];
        for (DDXMLElement *itemm in billItems)
        {
            NSMutableDictionary *oneitembill = [[NSMutableDictionary alloc] init];
            DDXMLElement *consumeid = [[itemm elementsForName:@"ConsumeID"] lastObject];
            DDXMLElement *serverprice = [[itemm elementsForName:@"ServerPrice"] lastObject];
            DDXMLElement *amount = [[itemm elementsForName:@"Amount"] lastObject];
            DDXMLElement *guestname = [[itemm elementsForName:@"GuestName"] lastObject];
            DDXMLElement *statusname = [[itemm elementsForName:@"StatusName"] lastObject];
            DDXMLElement *servename = [[itemm elementsForName:@"ServerName"] lastObject];
            DDXMLElement *sumdue = [[itemm elementsForName:@"SumDue"] lastObject];
            if (consumeid) {
                //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
                [oneitembill setObject:[consumeid stringValue] forKey:@"ConsumeID"];
            }else{
                [oneitembill setObject:@"" forKey:@"ConsumeID"];
            }
            if (serverprice) {
                //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
                [oneitembill setObject:[serverprice stringValue] forKey:@"ServerPrice"];
            }else{
                [oneitembill setObject:@"" forKey:@"ServerPrice"];
            }
            if (amount) {
                //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
                [oneitembill setObject:[amount stringValue] forKey:@"Amount"];
            }else{
                [oneitembill setObject:@"" forKey:@"Amount"];
            }
            
            if (guestname) {
                //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
                [oneitembill setObject:[guestname stringValue] forKey:@"GuestName"];
            }else{
                [oneitembill setObject:@"" forKey:@"GuestName"];
            }
            if (statusname) {
                //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
                [oneitembill setObject:[statusname stringValue] forKey:@"StatusName"];
            }else{
                [oneitembill setObject:@"" forKey:@"StatusName"];
            }
            if (servename) {
                //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
                [oneitembill setObject:[servename stringValue] forKey:@"ServerName"];
            }else{
                [oneitembill setObject:@"" forKey:@"ServerName"];
            }
            if (sumdue) {
                //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
                [oneitembill setObject:[sumdue stringValue] forKey:@"SumDue"];
            }else{
                [oneitembill setObject:@"" forKey:@"SumDue"];
            }
            [allbillitems addObject:oneitembill];
            
        }
        [oneplacebill setObject:allbillitems forKey:@"allbillarr"];
        [Todaybillarr addObject:oneplacebill];
    }
    
    [allinfodic setObject:Todaybillarr forKey:@"nopaybillarr"];
    
    return allinfodic;
}

//历史账单
+(NSMutableDictionary *)parserMyBill:(NSString *)responseXml
{
    NSMutableDictionary *Recorddic = [[NSMutableDictionary alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];
    if (result) {
        
        [Recorddic setObject:[result stringValue] forKey:@"Result"];
    }else{
        [Recorddic setObject:@"" forKey:@"Result"];
    }
    if (message) {
        
        [Recorddic setObject:[message stringValue] forKey:@"Message"];
    }else{
        [Recorddic setObject:@"" forKey:@"Message"];
    }
    
    NSMutableArray *allbillarr = [[NSMutableArray alloc]init];
    NSArray *Items = [root elementsForName:@"Bills"];//获取根节点项Item
    for (DDXMLElement *item in Items) {
        NSMutableDictionary *onedaybill = [[NSMutableDictionary alloc] init];
        DDXMLElement *date = [[item elementsForName:@"OrderDate"] lastObject];
        DDXMLElement *total = [[item elementsForName:@"TotalPrice"] lastObject];
        if (date) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [onedaybill setObject:[date stringValue] forKey:@"OrderDate"];
        }else{
            [onedaybill setObject:@"" forKey:@"OrderDate"];
        }
        if (total) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [onedaybill setObject:[total stringValue] forKey:@"TotalPrice"];
        }else{
            [onedaybill setObject:@"" forKey:@"TotalPrice"];
        }
        NSMutableArray *allplacearr = [[NSMutableArray alloc] init];
        DDXMLElement *bill = [[item elementsForName:@"Bill"] lastObject];
        NSArray *billlist = [bill elementsForName:@"BillList"];
        for (DDXMLElement *oneplace in billlist){
            NSMutableDictionary *placedic = [[NSMutableDictionary alloc] init];
            DDXMLElement *place = [[oneplace elementsForName:@"Place"] lastObject];
            DDXMLElement *summoney = [[oneplace elementsForName:@"SumMoney"] lastObject];
            DDXMLElement *playdate = [[oneplace elementsForName:@"PlayDate"] lastObject];
            [placedic setObject:[place stringValue] forKey:@"Place"];
            [placedic setObject:[summoney stringValue] forKey:@"SumMoney"];
            [placedic setObject:[playdate stringValue] forKey:@"PlayDate"];
            NSMutableArray *allitemarr = [[NSMutableArray alloc] init];
            NSArray *billlist = [oneplace elementsForName:@"BillItem"];
            for (DDXMLElement *oneitem in billlist)
            {
                NSMutableDictionary *itemdic = [[NSMutableDictionary alloc] init];
                DDXMLElement *consumeid = [[oneitem elementsForName:@"ConsumeID"] lastObject];//卡号
                DDXMLElement *guestname = [[oneitem elementsForName:@"GuestName"] lastObject];//嘉宾姓名
                DDXMLElement *statusname = [[oneitem elementsForName:@"StatusName"] lastObject];//客人身份
                DDXMLElement *servername = [[oneitem elementsForName:@"ServerName"] lastObject];//服务名
                DDXMLElement *serverprice = [[oneitem elementsForName:@"ServerPrice"] lastObject];//单价
                DDXMLElement *amount = [[oneitem elementsForName:@"Amount"] lastObject];//数量
                DDXMLElement *sumdue = [[oneitem elementsForName:@"SumDue"] lastObject];//总价
                
                [itemdic setObject:[consumeid stringValue] forKey:@"ConsumeID"];
                [itemdic setObject:[guestname stringValue] forKey:@"GuestName"];
                [itemdic setObject:[statusname stringValue] forKey:@"StatusName"];
                [itemdic setObject:[servername stringValue] forKey:@"ServerName"];
                [itemdic setObject:[serverprice stringValue] forKey:@"ServerPrice"];
                [itemdic setObject:[amount stringValue] forKey:@"Amount"];
                [itemdic setObject:[sumdue stringValue] forKey:@"SumDue"];
                
                [allitemarr addObject:itemdic];
            }
            [placedic setObject:allitemarr forKey:@"allitemarr"];//每个place里的item数组
            [allplacearr addObject:placedic];
            
        }
        [onedaybill setObject:allplacearr forKey:@"allplacearr"];
        
        
        
        [allbillarr addObject:onedaybill];
    }
    [Recorddic setObject:allbillarr forKey:@"allbill"];
    NSLog(@"%@",Recorddic);
    return Recorddic;
}

//个人打球成绩上传
+(NSMutableDictionary *)parserScoreupLoad:(NSString *)responseXml
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];
    if (result) {
        //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
        [dic setObject:[result stringValue] forKey:@"Result"];
    }else{
        [dic setObject:@"" forKey:@"Result"];
    }
    if (message) {
        //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
        [dic setObject:[message stringValue] forKey:@"Message"];
    }else{
        [dic setObject:@"" forKey:@"Message"];
    }
    return dic;
}
//<PersonageItems>
//<PlayDate>2016-07-08</PlayDate>
//<GuestName>张华龙</GuestName>
//<Caddieid>002</Caddieid>
//<DongNumber>18</DongNumber>
//<OutNum>14</OutNum>
//<InNum>18</InNum>
//<TotleHole>32</TotleHole>
//<Handicap>10</Handicap>
//<NetPole>22</NetPole>
//<ScoreHoleNum>2-2-2-2-2-0-0-2-2-2-2-2-2-2-2-2-2-2</ScoreHoleNum>
//<HolePar>4-3-4-5-4-4-5-3-4-4-3-4-4-5-4-3-4-5</HolePar>
//<OutPar>36</OutPar>
//<InPar>36</InPar>
//<TeeName>金TEE</TeeName>
//<LaneName>AB场</LaneName>
//</PersonageItems>
//个人打球成绩查询
+(NSMutableDictionary *)parserHistoryScore:(NSString *)responseXml
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [doc rootElement];
    
    DDXMLElement *result = [[root elementsForName:@"Result"] lastObject];
    DDXMLElement *message = [[root elementsForName:@"Message"] lastObject];
    if (result) {
        //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
        [dic setObject:[result stringValue] forKey:@"Result"];
    }else{
        [dic setObject:@"" forKey:@"Result"];
    }
    if (message) {
        //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
        [dic setObject:[message stringValue] forKey:@"Message"];
    }else{
        [dic setObject:@"" forKey:@"Message"];
    }
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSArray *Items = [root elementsForName:@"PersonageItems"];
    for (DDXMLElement *item in Items){
        NSMutableDictionary *itemdic = [[NSMutableDictionary alloc] init];
        DDXMLElement *playdate = [[item elementsForName:@"PlayDate"] lastObject];
        //        DDXMLElement *guestname = [[item elementsForName:@"GuestName"] lastObject];
        //        DDXMLElement *caddieid = [[item elementsForName:@"Caddieid"] lastObject];//成绩的时间次序
        //        DDXMLElement *dongnumber = [[item elementsForName:@"DongNumber"] lastObject];
        DDXMLElement *outnum = [[item elementsForName:@"OutNum"] lastObject];//前9
        DDXMLElement *innum = [[item elementsForName:@"InNum"] lastObject];//后9
        DDXMLElement *totlehole = [[item elementsForName:@"TotleHole"] lastObject];//总杆
        DDXMLElement *handicap = [[item elementsForName:@"Handicap"] lastObject];//差点
        DDXMLElement *netpole = [[item elementsForName:@"NetPole"] lastObject];//净杆
        DDXMLElement *scoreholenum = [[item elementsForName:@"ScoreHoleNum"] lastObject];
        //        DDXMLElement *holepar = [[item elementsForName:@"HolePar"] lastObject];//标准杆
        //        DDXMLElement *outpar = [[item elementsForName:@"OutPar"] lastObject];
        //        DDXMLElement *inpar = [[item elementsForName:@"InPar"] lastObject];
        //        DDXMLElement *teename = [[item elementsForName:@"TeeName"] lastObject];
        //        DDXMLElement *lanename = [[item elementsForName:@"LaneName"] lastObject];
        
        if (playdate) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [itemdic setObject:[playdate stringValue] forKey:@"PlayDate"];
        }else{
            [itemdic setObject:@"" forKey:@"PlayDate"];
        }
        if (totlehole) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [itemdic setObject:[totlehole stringValue] forKey:@"TotleHole"];
        }else{
            [itemdic setObject:@"" forKey:@"TotleHole"];
        }
        if (outnum) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [itemdic setObject:[outnum stringValue] forKey:@"OutNum"];
        }else{
            [itemdic setObject:@"" forKey:@"OutNum"];
        }
        if (innum) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [itemdic setObject:[innum stringValue] forKey:@"InNum"];
        }else{
            [itemdic setObject:@"" forKey:@"InNum"];
        }
        
        if (handicap) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [itemdic setObject:[handicap stringValue] forKey:@"Handicap"];
        }else{
            [itemdic setObject:@"" forKey:@"Handicap"];
        }
        if (netpole) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [itemdic setObject:[netpole stringValue] forKey:@"NetPole"];
        }else{
            [itemdic setObject:@"" forKey:@"NetPole"];
        }
        
        if (scoreholenum) {
            //            NSString *str = [NSString stringWithFormat:@"%@",[price stringValue]];
            [itemdic setObject:[scoreholenum stringValue] forKey:@"ScoreHoleNum"];
        }else{
            [itemdic setObject:@"" forKey:@"ScoreHoleNum"];
        }
        
        [arr addObject:itemdic];
    }
    [dic setObject:arr forKey:@"recordarr"];
    return dic;
    
}

+(NSMutableArray *)parserLane:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    DDXMLDocument *document = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [document rootElement];//获取所在的根结点
    NSArray *arrlishi = [root elementsForName:@"DicInfoItems"];
    for (DDXMLElement *item in arrlishi) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        DDXMLElement *code = [[item elementsForName:@"Code"] lastObject];
        DDXMLElement *name = [[item elementsForName:@"Name"] lastObject];
        if (code) {
            NSString *str = [code stringValue];
            [dic setObject:str forKey:@"code"];
        }
        if (name) {
            NSString *str = [name stringValue];
            [dic setObject:str forKey:@"name"];
        }
        [arr addObject:dic];
    }
    return arr;
}

+(NSMutableArray *)parserTee:(NSString *)responseXml{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    DDXMLDocument *document = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *root = [document rootElement];//获取所在的根结点
    NSArray *arrlishi = [root elementsForName:@"DicInfoItems"];
    for (DDXMLElement *item in arrlishi) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        DDXMLElement *code = [[item elementsForName:@"Code"] lastObject];
        DDXMLElement *name = [[item elementsForName:@"Name"] lastObject];
        if (code) {
            NSString *str = [code stringValue];
            [dic setObject:str forKey:@"code"];
        }
        if (name) {
            NSString *str = [name stringValue];
            [dic setObject:str forKey:@"name"];
        }
        [arr addObject:dic];
    }
    return arr;
}


+(NSMutableDictionary *)parserWxpayQuery:(NSString *)xmlParser{
    NSMutableDictionary *wxpayDic = [[NSMutableDictionary alloc] init];
    
    NSError *error = nil;
    DDXMLDocument *document = [[DDXMLDocument alloc] initWithXMLString:xmlParser options:0 error:&error];
    DDXMLElement *root = [document rootElement];//获取所在的根结点
    DDXMLElement *returncode = [[root elementsForName:@"Prepayid"] lastObject];
    DDXMLElement *msg = [[root elementsForName:@"Nonce_str"] lastObject];
    DDXMLElement *trade = [[root elementsForName:@"out_trade_no"] lastObject];
    if (returncode) {
        NSString *pack = [NSString stringWithFormat:@"%@",[returncode stringValue]];
        [wxpayDic setObject:pack forKey:@"prepay"];
    }
    if (msg) {
        NSString *pack = [NSString stringWithFormat:@"%@",[msg stringValue] ];
        [wxpayDic setObject:pack forKey:@"nonce"];
    }
    if (trade) {
        NSString *tradeno = [NSString stringWithFormat:@"%@",[trade stringValue]];
        [wxpayDic setObject:tradeno forKey:@"tradeno"];
    }
    
    
    return wxpayDic;
}


+(NSMutableArray *)parserIsPay:(NSString *)responseXml{
    NSMutableArray *isPay = [[NSMutableArray alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *result = [[note elementsForName:@"Result"] lastObject];
    DDXMLElement *mess = [[note elementsForName:@"Message"] lastObject];
    if (result) {
        NSString *res = [result stringValue];
        [isPay addObject:res];
    }
    if (mess) {
        NSString *mess1 = [mess stringValue];
        [isPay addObject:mess1];
    }
    
    return isPay;
}

+(NSMutableArray *)parserAllCardInfo:(NSString *)responseXml{
    
    NSMutableArray *many = [[NSMutableArray alloc] init];
    
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:responseXml options:0 error:nil];
    
    DDXMLElement *note = [doc rootElement];
    NSArray *card = [note elementsForName:@"Card"];
    
    for (DDXMLElement *its in card) {
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        
        DDXMLElement *cardNo = [[its elementsForName:@"CardNo"] lastObject];
        DDXMLElement *cardBalance = [[its elementsForName:@"CardBalance"] lastObject];
        if (cardNo) {
            NSString *str = [cardNo stringValue];
            [dic setValue:str forKey:@"cardNo"];
        }
        if (cardBalance) {
            NSString *str1 = [cardBalance stringValue];
            [dic setValue:str1 forKey:@"cardBalance"];
        }
        [many addObject:dic];
    }
    return many;
}


+(NSMutableDictionary *)parserCardPayment:(NSString *)responseXml{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *method = [[note elementsForName:@"Method"] objectAtIndex:0];
    DDXMLElement *result = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *billNumber = [[note elementsForName:@"BillNumber"] objectAtIndex:0];
    DDXMLElement *message = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (method) {
        NSString *str0 = [method stringValue];
        [dic setObject:str0 forKey:@"method"];
    }else {
        [dic setObject:@"" forKey:@"method"];
    }
    if (result) {
        NSString *str1 = [result stringValue];
        [dic setObject:str1 forKey:@"result"];
    }else {
        
        [dic setObject:@"" forKey:@"result"];
    }
    if (billNumber) {
        NSString *str2 = [billNumber stringValue];
        [dic setObject:str2 forKey:@"billNumber"];
    }else {
        
        [dic setObject:@"" forKey:@"billNumber"];
    }
    if (message) {
        NSString *str3 = [message stringValue];
        [dic setObject:str3 forKey:@"message"];
    }else {
       
        [dic setObject:@"" forKey:@"message"];
    }
    return dic;
}


+(NSMutableDictionary *)parserAccountWxApiPay:(NSString *)responseXml{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithXMLString:responseXml options:0 error:nil];
    DDXMLElement *note = [doc rootElement];
    DDXMLElement *method = [[note elementsForName:@"Method"] objectAtIndex:0];
    DDXMLElement *result = [[note elementsForName:@"Result"] objectAtIndex:0];
    DDXMLElement *billNumber = [[note elementsForName:@"BillNumber"] objectAtIndex:0];
    DDXMLElement *message = [[note elementsForName:@"Message"] objectAtIndex:0];
    if (method) {
        NSString *str0 = [method stringValue];
        [dic setObject:str0 forKey:@"method"];
    }else {
        [dic setObject:@"" forKey:@"method"];
    }
    if (result) {
        NSString *str1 = [result stringValue];
        [dic setObject:str1 forKey:@"result"];
    }else {
        
        [dic setObject:@"" forKey:@"result"];
    }
    if (billNumber) {
        NSString *str2 = [billNumber stringValue];
        [dic setObject:str2 forKey:@"billNumber"];
    }else {
        
        [dic setObject:@"" forKey:@"billNumber"];
    }
    if (message) {
        NSString *str3 = [message stringValue];
        [dic setObject:str3 forKey:@"message"];
    }else {
        
        [dic setObject:@"" forKey:@"message"];
    }
    return dic;
}

@end
