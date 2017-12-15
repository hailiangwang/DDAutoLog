//
//  DDAutoLogManager.h
//  DDAutoLogExample
//
//  Created by 王海亮 on 2017/12/13.
//  Copyright © 2017年 王海亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *DDAutoLogEventIDKey = @"DD_LOG_EVENTID_KEY";
static NSString *DDAutoLogInfoKey = @"DD_LOG_INFO_KEY";

typedef void(^DDAutoLogManagerBlock)(NSDictionary *logDictionary);

@interface DDAutoLogManager : NSObject

/**
 是否开启调试模式
 */
@property (nonatomic, assign) BOOL isDebug;

/**
 配置数据
 */
@property (nonatomic, strong) NSArray *configArray;

@property (nonatomic, copy) DDAutoLogManagerBlock successBlock;
@property (nonatomic, copy) DDAutoLogManagerBlock debugBlock;

+ (DDAutoLogManager *)sharedInstance;

/**
 开始打点

 @param successBlock 成功回调
 @param debugBlock 调试模式回调
 */
- (void)startWithCompletionBlockWithSuccess:(DDAutoLogManagerBlock)successBlock debug:(DDAutoLogManagerBlock)debugBlock;

@end
