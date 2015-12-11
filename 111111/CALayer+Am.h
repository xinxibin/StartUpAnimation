//
//  CALayer+Cool.h
//  启动动画
//
//  Created by xinxibin on 15/12/1.
//  Copyright © 2015年 xinxibin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Am)

/**
 动画类型
 */
typedef enum {
    TransitionAnimTypeRippleEffect = 0,
    TransitionAnimTypeSuckEffect,
    TransitionAnimTypePageCurl,
    TransitionAnimTypePageUnCurl,
    TransitionAnimTypeOglFlip,
    TransitionAnimTypeCube,
    TransitionAnimTypeReveal,
    TransitionAnimTypeRamdom, //随机
    
}TransitionAnimType;

/**
 动画方向
 */

typedef enum {
    TransitionDirectionFromTop = 0,
    TransitionDirectionFromLeft,
    TransitionDirectionFromBotton,
    TransitionDirectionFromRight,
    TransitionDirectionRamdom, //随机
}TransitionDirection;



/**
 *  动画曲线
 */

typedef enum {
    TransitionCurveDefault = 0,
    TransitionCurveEaseIn,
    TransitionCurveEaseOut,
    TransitionCurveEaseInEaseOut,
    TransitionCurveLinear,
    TransitionCurveRamdom,//随机
}TransitionCurve;



/**
 *  转场动画
 *
 *  @param animType      动画类型
 *  @param directionType 动画方向
 *  @param curve         动画曲线
 *  @param duration      动画时长
 *
 *  @return 动画实例
 */
- (CATransition*)transitionWithAnimType:(TransitionAnimType)animType directionType:(TransitionDirection)directionType curve:(TransitionCurve)curve duration:(CGFloat)duration;

@end
