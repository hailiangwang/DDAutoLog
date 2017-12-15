//
//  DDButtonViewController.m
//  DDAutoLog_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDButtonViewController.h"
#import "UIView+DDFrame.h"

@interface DDButtonViewController ()

@property (nonatomic, strong) UIButton *logButton;

@end

@implementation DDButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubViews];
    
    //配置打点info信息
    self.ddInfoDictionary = @{@"id":@"your id",
                              @"type":@"your type"};
}

- (void)setupSubViews {
    [self.view addSubview:self.logButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.logButton.dd_width = 180.f;
    self.logButton.dd_height = 44.f;
    self.logButton.center = self.view.center;
}

#pragma mark - button action

- (void)logButtonClick:(UIButton *)sender {
    
}

#pragma mark - setters and getters

- (UIButton *)logButton {
    if (nil == _logButton) {
        _logButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logButton setTitle:@"click me" forState:UIControlStateNormal];
        [_logButton setBackgroundColor:[UIColor orangeColor]];
        [_logButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logButton addTarget:self
                       action:@selector(logButtonClick:)
             forControlEvents:UIControlEventTouchUpInside];
    }
    return _logButton;
}


@end
