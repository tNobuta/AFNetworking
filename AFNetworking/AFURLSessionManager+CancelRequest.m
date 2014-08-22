//
//  AFURLSessionManager+CancelRequest.m
//  youpinwei
//
//  Created by tmy on 14-8-22.
//  Copyright (c) 2014年 nobuta. All rights reserved.
//

#import "AFURLSessionManager+CancelRequest.h"

@implementation AFURLSessionManager (CancelRequest)

- (void)cancelRequest:(NSString *)requestIdentifier {
    NSUInteger taskIdentifier = [requestIdentifier integerValue];
    
    for (NSURLSessionDataTask *task in self.tasks) {
        if (task.taskIdentifier == taskIdentifier) {
            [task cancel];
        }
    }
}

@end
