//
//  XCXCCountdownButton.h
//  倒计时按钮
//
//  Created by 樊小聪 on 16/5/30.
//  Copyright © 2016年 樊小聪. All rights reserved.
//


/* 🐖 ***************************** 🐖 Warning 🐖 *****************************  🐖 */
/* 注意：当您创建按钮的时候，按钮的样式要设置为：UIButtonTypeCustom，否则会出现文字一闪一闪的Bug */
/* 🐖 ***************************** 🐖 Warning 🐖 *****************************  🐖 */



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XCCountdownButtonStatus)
{
    XCCountdownButtonStatusNormal = 0,    // 正常状态下的按钮（还未开始计时，按钮可点击）
    XCCountdownButtonStatusCounting,      // 正在倒计时状态（不可点击）
    XCCountdownButtonStatusFinished       // 倒计时结束状态（可点击）
};


IB_DESIGNABLE

@interface XCCountdownButton : UIButton

/** 👀 按钮的状态 👀 */
@property (assign, nonatomic, readonly) XCCountdownButtonStatus status;

/** 👀 点击之后要执行的操作 👀 */
@property (copy, nonatomic) void(^didClickHandle)(XCCountdownButton *button);


/** 👀 倒计时的时间（单位：秒，默认 60s） 👀 */
@property (assign, nonatomic) IBInspectable NSUInteger duration;

/** 👀 正常状态下的按钮的背景颜色 （默认白色） 👀 */
@property (strong, nonatomic) IBInspectable UIColor *normalBackgroundColor;
/** 👀 正在倒计时状态下的按钮的背景颜色 （默认灰色） 👀 */
@property (strong, nonatomic) IBInspectable UIColor *countingBackgroundColor;
/** 👀 倒计时结束状态下的按钮的背景颜色 （默认白色） 👀 */
@property (strong, nonatomic) IBInspectable UIColor *finishedBackgroundColor;

/** 👀 正常状态下的按钮的文字颜色 （默认黑色） 👀 */
@property (strong, nonatomic) IBInspectable UIColor *normalTitleColor;
/** 👀 正在倒计时状态下的按钮的文字颜色 （默认黑色） 👀 */
@property (strong, nonatomic) IBInspectable UIColor *countingTitleColor;
/** 👀 倒计时结束状态下的按钮的文字颜色 （默认黑色）👀 */
@property (strong, nonatomic) IBInspectable UIColor *finishedTitleColor;

/** 👀 正常状态下的按钮的文字 👀 */
@property (copy, nonatomic) IBInspectable NSString *normalTitle;
/** 👀 正在倒计时状态下的按钮的文字(注意：此处的标题不包涵 计时数，如：(标题："45s后重新开始计时"，则只需传入："重新开始计时")) 👀 */
@property (copy, nonatomic) IBInspectable NSString *countingTitle;
/** 👀 倒计时结束状态下的按钮的文字 👀 */
@property (copy, nonatomic) IBInspectable NSString *finishedTitle;

/**
 *  开始计时
 */
- (void)startCounting;

@end


