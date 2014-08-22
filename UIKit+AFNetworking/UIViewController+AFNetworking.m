//
//  UIViewController+AFNetworking.m
//  youpinwei
//
//  Created by tmy on 14-8-22.
//  Copyright (c) 2014年 nobuta. All rights reserved.
//

#import <objc/runtime.h>
#import "AFURLSessionManager.h"
#import "AFURLSessionManager+CancelRequest.h"
#import "UIViewController+AFNetworking.h"

#define UIViewControllerAFNetworkingRequestsKey @"UIViewControllerAFNetworkingRequestsKey"

@implementation UIViewController (AFNetworking)

- (NSArray *)currentRequests {
    return [self currentRequestsInternal];
}

- (NSMutableArray *)currentRequestsInternal {
    NSMutableArray *requests = objc_getAssociatedObject(self, UIViewControllerAFNetworkingRequestsKey);
    if (!requests) {
        requests = [[NSMutableArray alloc] init];
        objc_setAssociatedObject(self, UIViewControllerAFNetworkingRequestsKey, requests, OBJC_ASSOCIATION_RETAIN);
    }
    
    return requests;
}

- (void)didSendTask:(NSInteger)taskIdentifier {
    NSMutableArray *requests = [self currentRequestsInternal];
    if (![requests containsObject:@(taskIdentifier)]) {
        [requests addObject:@(taskIdentifier)];
    }
}

- (void)cancelTask:(NSInteger)taskIdentifier inSessionManager:(AFURLSessionManager *)manager {
    [manager cancelTask:taskIdentifier];
    [[self currentRequestsInternal] removeObject:@(taskIdentifier)];
}

- (void)cancelTasksInSessionManager:(AFURLSessionManager *)manager {
    NSMutableArray *requests = [self currentRequestsInternal];
    for(NSNumber *identifier in requests) {
        [manager cancelTask: [identifier unsignedIntValue]];
    }
        
    [[self currentRequestsInternal] removeAllObjects];
}

@end
