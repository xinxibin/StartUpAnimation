//
//  CoreLaunchPlus.m
//  启动动画
//
//  Created by xinxibin on 15/12/1.
//  Copyright © 2015年 xinxibin. All rights reserved.
//

#import "AnimatedRotate.h"
static const CGFloat duration = 1.5f;

@implementation AnimatedRotate

+(void)animWithWindow:(UIWindow *)window image:(UIImage *)image {
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageV.image = image;
    [window.rootViewController.view addSubview:imageV];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
       
        [self rotation:imageV.layer];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [imageV removeFromSuperview];
        });
        
    });
}

+ (void)rotation:(CALayer*)layer {
    
    CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"transform.rotation.z"]];
    rotationAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnim.fromValue=@(0);
    rotationAnim.toValue = @(M_PI_2);
    rotationAnim.duration = duration;
    rotationAnim.autoreverses = NO;//自动反转
    rotationAnim.removedOnCompletion = YES;
    rotationAnim.repeatCount = 0;
    rotationAnim.fillMode=kCAFillModeForwards;
    rotationAnim.removedOnCompletion = NO;

    //锚点
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position=CGPointMake(0, layer.bounds.size.height);
    //添加
    [layer addAnimation:rotationAnim forKey:@"rotationAnim"];

}


@end
