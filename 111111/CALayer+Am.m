//
//  CALayer+Cool.m
//  启动动画
//
//  Created by xinxibin on 15/12/1.
//  Copyright © 2015年 xinxibin. All rights reserved.
//

#import "CALayer+Am.h"

@implementation CALayer (Am)
- (CATransition*)transitionWithAnimType:(TransitionAnimType)animType directionType:(TransitionDirection)directionType curve:(TransitionCurve)curve duration:(CGFloat)duration
{
    NSString *key = @"transition";
    if ([self animationForKey:key]) {
        [self removeAnimationForKey:key];
    }
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.type = [self animationTypeWithTransitionType:animType];
    transition.subtype = [self animaSubtype:directionType];
    transition.timingFunction = [CAMediaTimingFunction functionWithName:[self animaCurve:curve]];
    transition.removedOnCompletion = YES;
    
    [self addAnimation:transition forKey:key];
    return transition;
}

/**
 *  返回字符串
 *
 *  @param array    类型
 *  @param index    索引
 *  @param isRamdom 是否随机
 *
 *  @return 返回对应类型
 */
- (id)objFromArray:(NSArray*)array index:(NSUInteger)index isRamdom:(BOOL)isRamdom {
    NSUInteger count = array.count;
    NSUInteger i = isRamdom ? arc4random() % count :index;
    return array[i];
}

/**
 *  动画类型
 *
 *  @param type 枚举值
 *
 *  @return 返回一个动画类型
 */
- (NSString*)animationTypeWithTransitionType:(TransitionAnimType)type {
    NSArray *animArray=@[@"rippleEffect",@"suckEffect",@"pageCurl",@"oglFlip",@"cube",@"reveal",@"pageUnCurl",@"push"];
    return [self objFromArray:animArray index:type isRamdom:TransitionAnimTypeRamdom == type];
}

/**
 *  动画方向
 *
 *  @param subType 枚举值
 *
 *  @return 返回一个方向
 */
- (NSString*)animaSubtype:(TransitionDirection)subType {
    NSArray * subTypes = @[kCATransitionFromRight,kCATransitionFromLeft,kCATransitionFromTop,kCATransitionFromBottom];
    return [self objFromArray:subTypes index:subType isRamdom:(TransitionDirectionRamdom == subType)];
}

/**
 *  动画曲线
 *
 *  @param curve 枚举
 *
 *  @return 返回一种动画曲线
 */
- (NSString*)animaCurve:(TransitionCurve)curve {
    NSArray * curveNmaes = @[kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionLinear];
    return [self objFromArray:curveNmaes index:curve isRamdom:(TransitionCurveRamdom == curve)];
}


@end
