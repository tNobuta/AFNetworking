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

- (void)didSendRequest:(NSString *)requestIdentifier {
    NSMutableArray *requests = [self currentRequestsInternal];
    if (![requests containsObject:requestIdentifier]) {
        [requests addObject:requestIdentifier];
    }
}

- (void)didFinishRequest:(NSString *)requestIdentifier {
    NSMutableArray *requests = [self currentRequestsInternal];
    [requests removeObject:requestIdentifier];
}

- (void)cancelRequest:(NSString *)requestIdentifier inSessionManager:(AFURLSessionManager *)manager {
    [manager cancelRequest:requestIdentifier];
    [[self currentRequestsInternal] removeObject:requestIdentifier];
}

- (void)cancelRequestsinSessionManager:(AFURLSessionManager *)manager {
    NSMutableArray *requests = [self currentRequestsInternal];
    for(NSString *identifier in requests) {
        [manager cancelRequest:identifier];
    }
        
    [[self currentRequestsInternal] removeAllObjects];
}

@end
