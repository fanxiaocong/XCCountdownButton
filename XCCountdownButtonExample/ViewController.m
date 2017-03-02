//
//  ViewController.m
//  XCCountdownButtonExample
//
//  Created by 樊小聪 on 2017/3/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCCountdownButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet XCCountdownButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button.didClickHandle = ^(XCCountdownButton *button){
        
        NSLog(@"点击了按钮");
        
        [button startCounting];
    };
}


@end
