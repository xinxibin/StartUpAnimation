//
//  CoreLaunchCool.m
//  启动动画
//
//  Created by xinxibin on 15/12/1.
//  Copyright © 2015年 xinxibin. All rights reserved.
//

#import "Animateds.h"
#import "CALayer+Am.h"
@implementation Animateds

+ (void)animWithWindow:(UIWindow*)window image:(UIImage*)image{
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageV.image = image;
    [window.rootViewController.view addSubview:imageV];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,NSEC_PER_SEC),dispatch_get_main_queue(),^{
        [imageV removeFromSuperview];
        [window.layer transitionWithAnimType:TransitionAnimTypeRamdom directionType:TransitionDirectionRamdom curve:TransitionCurveRamdom duration:1.6f];
    });
}


@end
