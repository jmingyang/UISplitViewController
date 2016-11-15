//
//  AFAppDotNetAPIClient.h
//  Network
//
//  Created by lucid on 16/6/9.
//  Copyright © 2016年 lucid. All rights reserved.
//

#import "AFNetworking.h"


@interface AFAppDotNetAPIClient : AFHTTPSessionManager


+ (instancetype)sharedClient;

@end
