//
//  AnimationView.h
//  MaskView实现图片切换
//
//  Created by rimi on 15/7/10.
//  Copyright (c) 2015年 LeeSefung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationView : UIView

/**
 *  ImageView初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame
                    imageName:(NSString *)imageName
                  contentMode:(UIViewContentMode)contentMode
                verticalCount:(NSInteger)verticalCount
              horizontalCount:(NSInteger)horizontalCount
                hideDuradtion:(NSTimeInterval)hideDuradtion
         animationGapDuration:(NSTimeInterval)animationGapDuration;

/**
 *  Image显示方式
 */
@property (nonatomic) UIViewContentMode  contentMode;

/**
 *  要显示的相片
 */
@property (nonatomic, strong) UIImage   *image;

/**
 *  垂直方向方块的个数
 */
@property (nonatomic) NSInteger          verticalCount;

/**
 *  水平的个数
 */
@property (nonatomic) NSInteger          horizontalCount;

/**
 *  开始构造出作为mask用的view
 */
- (void)buildMaskView;

/**
 *  渐变动画的时间
 */
@property (nonatomic) NSTimeInterval     hideDuradtion;

/**
 *  两个动画之间的时间间隔
 */
@property (nonatomic) NSTimeInterval     animationGapDuration;

/**
 *  开始隐藏动画
 *
 *  @param animated 是否执行动画
 */
- (void)hideAnimated:(BOOL)animated;

/**
 *  开始显示动画
 *
 *  @param animated 时候执行动画
 */
- (void)showAnimated:(BOOL)animated;

@end
