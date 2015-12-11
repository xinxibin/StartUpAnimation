//
//  CoreLaunchLite.h
//  启动动画
//
//  Created by xinxibin on 15/12/1.
//  Copyright © 2015年 xinxibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
 
@interface AnimatedDesalination : NSObject
//启动调用也可以在viewController里调用
+ (void)animWithView:(id)view image:(UIImage*)image frame:(CGRect)rect ;

@end
