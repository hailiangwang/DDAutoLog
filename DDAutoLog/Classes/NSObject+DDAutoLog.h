//
//  NSObject+DDAutoLog.h
//  DDAutoLogExample
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 王海亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DDAutoLog)

@property (nonatomic ,strong) NSDictionary *ddInfoDictionary;

- (void)configInfoData:(id)obj;

@end
