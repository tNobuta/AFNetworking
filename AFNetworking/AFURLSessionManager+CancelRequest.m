//
//  AFURLSessionManager+CancelRequest.m
//  youpinwei
//
//  Created by tmy on 14-8-22.
//  Copyright (c) 2014年 nobuta. All rights reserved.
//

#import "AFURLSessionManager+CancelRequest.h"

@implementation AFURLSessionManager (CancelRequest)

- (void)cancelTask:(NSUInteger)taskIdentifier {
    for (NSURLSessionDataTask *task in self.tasks) {
        if (task.taskIdentifier == taskIdentifier) {
            [task cancel];
        }
    }
}

- (NSURLSessionTask *)taskForTaskIdentifier:(NSUInteger)taskIdentifier {
    NSURLSessionTask *existTask = nil;
    for (NSURLSessionTask *task in self.tasks) {
        if (task.taskIdentifier == taskIdentifier) {
            existTask = task;
            break;
        }
    }
    
    return existTask;
}

@end
