//
//  AFAppDotNetAPIClient.m
//  Network
//
//  Created by lucid on 16/6/9.
//  Copyright © 2016年 lucid. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

//static NSString * const AFAppDotNetAPIBaseURLString = @"http://202.200.112.149:8017/Phone.asmx/";
//static NSString * const AFAppDotNetAPIBaseURLString = @"http://125.79.18.118:8025/GolfSellShopApp.asmx/";

//static NSString * const AFAppDotNetAPIBaseURLString = @"http://hx.gooou.com/GolfSellShopApp.asmx/";
static NSString *  AFAppDotNetAPIBaseURLString ;


@implementation AFAppDotNetAPIClient


+ (instancetype)sharedClient {
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"ServerIP"] isEqual:nil]) {
        AFAppDotNetAPIBaseURLString = [[NSUserDefaults standardUserDefaults] objectForKey:@"ServerIP"];
        static AFAppDotNetAPIClient *_sharedClient = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
            _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        });
        return _sharedClient;

    }else{
        return nil;
    
    }
    
}

@end
