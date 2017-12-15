//
//  DDAutoLogOperation.h
//  DDAutoLog
//
//  Created by 王海亮 on 2017/12/14.
//

#import <Foundation/Foundation.h>

@interface DDAutoLogOperation : NSObject

+ (DDAutoLogOperation *)sharedInstance;

/**
 发送日志
 
 @param eventId 事件id
 @param info 日志内容
 */
- (void)sendLogData:(NSString *)eventId info:(NSDictionary *)info;

@end

