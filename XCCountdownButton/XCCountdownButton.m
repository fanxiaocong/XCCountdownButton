//
//  XCXCCountdownButton.m
//  倒计时按钮
//
//  Created by 樊小聪 on 16/5/30.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import "XCCountdownButton.h"

@interface XCCountdownButton ()

@property (strong, nonatomic) NSTimer *timer;

@property (assign, nonatomic) NSUInteger totalCount;

@end

@implementation XCCountdownButton

#pragma mark - ⏳ 👀 LifeCycle Method 👀

- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - 👀 Init Method 👀 💤

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        // 设置默认参数
        [self setupDefaults];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 设置默认参数
        [self setupDefaults];
    }
    
    return self;
}

// 设置默认参数
- (void)setupDefaults
{
    self.titleLabel.font = [UIFont systemFontOfSize:13];

    // 设置默认背景颜色
    self.normalBackgroundColor   = [UIColor whiteColor];
    self.countingBackgroundColor = [UIColor grayColor];
    self.finishedBackgroundColor = [UIColor whiteColor];
    
    // 设置默认文字颜色
    self.normalTitleColor   = [UIColor blackColor];
    self.countingTitleColor = [UIColor blackColor];
    self.finishedTitleColor = [UIColor blackColor];
    
    // 设置默认文字
    self.normalTitle   = @"点击开始计时";
    self.countingTitle = @"重新开始计时";
    self.finishedTitle = @"重新开始计时";
    
    self.status     = XCCountdownButtonStatusNormal;
    self.duration   = 10;
    
    [self addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 💤 👀 LazyLoad Method 👀

- (NSTimer *)timer
{
    if (_timer == nil)
    {
       _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(calculateTime) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

#pragma mark - 👀 Setter Method 👀 💤

- (void)setStatus:(XCCountdownButtonStatus)status
{
    _status = status;
    
    switch (status) {
        // 未开始状态
        case XCCountdownButtonStatusNormal:
        {
            [self setUserInteractionEnabled:YES];
            [self setBackgroundColor:self.normalBackgroundColor];
            [self setTitleColor:self.normalTitleColor forState:UIControlStateNormal];
            [self setTitle:self.normalTitle forState:UIControlStateNormal];
            
            break;
        }
        // 正在倒计时中
        case XCCountdownButtonStatusCounting:
        {
            [self setUserInteractionEnabled:NO];
            [self setBackgroundColor:self.countingBackgroundColor];
            [self setTitleColor:self.countingTitleColor forState:UIControlStateNormal];
            
            break;
        }
        // 倒计时结束 
        case XCCountdownButtonStatusFinished:
        {
            [self setDuration:self.totalCount];
            [self setUserInteractionEnabled:YES];
            [self setBackgroundColor:self.finishedBackgroundColor];
            [self setTitleColor:self.finishedTitleColor forState:UIControlStateNormal];
            [self setTitle:self.finishedTitle forState:UIControlStateNormal];
            
            break;
        }
    }
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor
{
    _normalBackgroundColor = normalBackgroundColor;
    
    [self setBackgroundColor:self.normalBackgroundColor];
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor
{
    _normalTitleColor = normalTitleColor;
    
    [self setTitleColor:self.normalTitleColor forState:UIControlStateNormal];
}

- (void)setNormalTitle:(NSString *)normalTitle
{
    _normalTitle = [normalTitle copy];
    
    [self setTitle:self.normalTitle forState:UIControlStateNormal];
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

#pragma mark - 🎬 👀 Action Method 👀

// 按钮的点击事件
- (void)didClick
{
    if (self.didClickHandle)
    {
        self.didClickHandle(self);
    }
}

#pragma mark - 🔓 👀 Public Method 👀

- (void)startCounting
{
    self.status = XCCountdownButtonStatusCounting;
    self.totalCount = self.duration;
    
    [self.timer setFireDate:[NSDate distantPast]];
    
    [self setupCountingTitle];
}

#pragma mark - 🔒 👀 Privite Method 👀

- (void)setupCountingTitle
{
    NSString *title = [NSString stringWithFormat:@"%zis后%@", self.duration, self.countingTitle];
    [self setTitle:title forState:UIControlStateNormal];
}

// 开始倒计时的回调
- (void)calculateTime
{
    self.duration -= 1;
    
    [self setupCountingTitle];
    
    if (self.duration == 1)
    {
        [self.timer setFireDate:[NSDate distantFuture]];
        [self performSelector:@selector(reset) withObject:NULL afterDelay:1.0];
    }
}

// 重置
- (void)reset
{
    self.status = XCCountdownButtonStatusFinished;
}

@end



