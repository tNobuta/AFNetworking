//
//  AFURLSessionManager+CancelRequest.h
//  youpinwei
//
//  Created by tmy on 14-8-22.
//  Copyright (c) 2014年 nobuta. All rights reserved.
//

#import "AFURLSessionManager.h"

@interface AFURLSessionManager (CancelRequest)

- (void)cancelRequest:(NSString *)requestIdentifier;

@end
