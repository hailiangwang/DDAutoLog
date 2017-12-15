//
//  DDAutoLogOperation.m
//  DDAutoLog
//
//  Created by 王海亮 on 2017/12/14.
//

#import "DDAutoLogOperation.h"
#import "DDAutoLogManager.h"
#import "NSObject+DDAutoLog.h"

@implementation DDAutoLogOperation

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

/**
 发送日志
 
 @param eventId 日志id
 @param info 日志内容
 */
- (void)sendLogData:(NSString *)eventId info:(NSDictionary *)info {
    NSDictionary *logDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   eventId.length > 0 ? eventId : @"", DDAutoLogEventIDKey,
                                   info ? info : [[NSDictionary alloc] init], DDAutoLogInfoKey, nil];
    
    if ([DDAutoLogManager sharedInstance].configArray.count > 0 &&
        eventId.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(DD_LOG_EVENTID_KEY == %@)",eventId];
        NSArray *filtered = [[DDAutoLogManager sharedInstance].configArray filteredArrayUsingPredicate:predicate];
        if ([filtered count] > 0) {
            if ([DDAutoLogManager sharedInstance].successBlock) {
                [DDAutoLogManager sharedInstance].successBlock(logDictionary);
            }
        }
    }
    
    if ([DDAutoLogManager sharedInstance].isDebug &&
        [DDAutoLogManager sharedInstance].debugBlock) {
        [DDAutoLogManager sharedInstance].debugBlock(logDictionary);
    }
}

@end

