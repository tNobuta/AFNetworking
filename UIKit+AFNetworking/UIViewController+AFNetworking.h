//
//  UIViewController+AFNetworking.h
//  youpinwei
//
//  Created by tmy on 14-8-22.
//  Copyright (c) 2014年 nobuta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AFNetworking)

@property (nonatomic, readonly) NSArray *currentRequests;

- (void)didSendTask:(NSInteger)taskIdentifier;
- (void)cancelTask:(NSInteger)taskIdentifier inSessionManager:(AFURLSessionManager *)manager;
- (void)cancelTasksInSessionManager:(AFURLSessionManager *)manager;

@end
