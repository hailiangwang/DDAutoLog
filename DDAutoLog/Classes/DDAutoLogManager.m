//
//  DDAutoLogManager.m
//  DDAutoLogExample
//
//  Created by 王海亮 on 2017/12/13.
//  Copyright © 2017年 王海亮. All rights reserved.
//

#import "DDAutoLogManager.h"
#import "UIButton+DDAutoLog.h"
#import "UITableView+DDAutoLog.h"
#import "UICollectionView+DDAutoLog.h"
#import "UIView+DDAutoLog.h"

@implementation DDAutoLogManager

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - public method
/**
 开始打点
 
 @param successBlock 成功回调
 @param debugBlock 调试模式回调
 */
- (void)startWithCompletionBlockWithSuccess:(DDAutoLogManagerBlock)successBlock debug:(DDAutoLogManagerBlock)debugBlock {
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        [UIButton startLog];
        [UITableView startLog];
        [UICollectionView startLog];
        [UIView startLog];
    });
    
    self.successBlock = successBlock;
    self.debugBlock = debugBlock;
}

@end
