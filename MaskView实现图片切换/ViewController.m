//
//  ViewController.m
//  MaskView实现图片切换
//
//  Created by rimi on 15/7/10.
//  Copyright (c) 2015年 LeeSefung. All rights reserved.
//  https://github.com/LeeSefung/MaskViewAnimation.git
//

#import "ViewController.h"
#include "AnimationView.h"

typedef enum : NSUInteger {
    LSTypeONE,
    LSTypeTWO,
} LSType;
@interface ViewController ()

@property (nonatomic, strong) AnimationView *animationOne;
@property (nonatomic, strong) AnimationView *animationTwo;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) LSType lsType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeInterface];
}

- (void)initializeInterface {
    
    //初始化第一张图片
    self.animationOne = [[AnimationView alloc] initWithFrame:self.view.bounds
                                                   imageName:@"1"
                                                 contentMode:UIViewContentModeScaleAspectFill
                                               verticalCount:2
                                             horizontalCount:12
                                               hideDuradtion:1.f
                                        animationGapDuration:0.1f];
    [self.view addSubview:self.animationOne];
    
    //初始化第二张图片
    self.animationTwo = [[AnimationView alloc] initWithFrame:self.view.bounds
                                                   imageName:@"2"
                                                 contentMode:UIViewContentModeScaleAspectFill
                                               verticalCount:2
                                             horizontalCount:12
                                               hideDuradtion:1.f
                                        animationGapDuration:0.1f];
    [self.view addSubview:self.animationTwo];
    //影藏第二张图片
    [self.animationTwo hideAnimated:YES];
    
    self.lsType = LSTypeONE;
    // 定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:6
                                                  target:self
                                                selector:@selector(timerEvent)
                                                userInfo:nil
                                                 repeats:YES];
    
}

- (void)timerEvent {
    
    if (self.lsType == LSTypeONE) {
        
        self.lsType = LSTypeTWO;
        [self.view sendSubviewToBack:self.animationTwo];
        [self.animationTwo showAnimated:NO];
        [self.animationOne hideAnimated:YES];
    } else {
        
        self.lsType = LSTypeONE;
        [self.view sendSubviewToBack:self.animationOne];
        [self.animationOne showAnimated:NO];
        [self.animationTwo hideAnimated:YES];
    }

}
@end
