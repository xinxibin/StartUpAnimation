//
//  CoreLaunchLite.m
//  启动动画
//
//  Created by xinxibin on 15/12/1.
//  Copyright © 2015年 xinxibin. All rights reserved.
//
#import "AnimatedDesalination.h"

@implementation AnimatedDesalination

+ (void)animWithView:(id)view image:(UIImage*)image frame:(CGRect)rect{
    UIImageView * imageV =  [[UIImageView alloc] initWithFrame:rect];
    if ([view isKindOfClass:[UIWindow class]]) {
        imageV.image = image;

        UIWindow * window = view;
        [window.rootViewController.view addSubview:imageV];
    }else if ([view isKindOfClass:[UIViewController class]]){
        imageV.image = image;
        UIViewController * vc = nil;
        vc = view;
        [vc.view addSubview:imageV];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:1.5 animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            imageV.transform = CGAffineTransformMakeScale(2.f, 2.f);
            imageV.alpha = 0;
        } completion:^(BOOL finished) {
            [imageV removeFromSuperview];
        }];
    });
}

@end
