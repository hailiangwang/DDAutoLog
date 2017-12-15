//
//  UIButton+DDAutoLog.m
//  DDAutoLogExample
//
//  Created by 王海亮 on 2017/12/13.
//  Copyright © 2017年 王海亮. All rights reserved.
//

#import "UIButton+DDAutoLog.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "DDAutoLogOperation.h"
#import "NSObject+DDAutoLog.h"

@implementation UIButton (DDAutoLog)

+ (void)startLog {
    Method endTrackingMethod = class_getInstanceMethod(self, @selector(endTrackingWithTouch:withEvent:));
    Method ddEndTrackingMethod = class_getInstanceMethod(self, @selector(dd_endTrackingWithTouch:withEvent:));
    method_exchangeImplementations(endTrackingMethod, ddEndTrackingMethod);
}

- (void)dd_endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    //只监听UIButton
    if (![self isMemberOfClass:[UIButton class]]) {
        return;
    }
    
    [self dd_endTrackingWithTouch:touch withEvent:event];
    NSArray *targers = [self.allTargets allObjects];
    if (targers.count > 0) {
        NSArray *actions = [self actionsForTarget:[targers firstObject] forControlEvent:UIControlEventTouchUpInside];
        if (actions.count > 0 &&
            [[actions firstObject] length] > 0) {
            
            NSString *eventId = [NSString stringWithFormat:@"%@&&%@",NSStringFromClass([[targers firstObject] class]),[actions firstObject]];
            NSDictionary *infoDictionary = [[targers firstObject] ddInfoDictionary];
            [[DDAutoLogOperation sharedInstance] sendLogData:eventId
                                                        info:infoDictionary];
        }
    }
}

@end
