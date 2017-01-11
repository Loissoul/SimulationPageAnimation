//
//  PGQTransitionProperty.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/11/30.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PGQTransitionTypedefConfig.h"

@interface PGQTransitionProperty : NSObject

/*
 * 设置转场时间
 */
@property (nonatomic, assign) NSTimeInterval animationTime;

/*
 * 设置转场方式 push .etc
 */
@property (nonatomic, assign) PGQTransitionType transitionType;

/*
 * 设置转场的动画
 */
@property (nonatomic, assign) PGQTransitionAnimationType animationType;

/*
 * 设置转场返回手势
 */
@property (nonatomic, assign) PGQGestureType backGestureType;

/*
 * 设置是否要返回的手势
 */
@property (nonatomic, assign) BOOL backGestureEnable;

/*
 * 系统方式返回
 */
@property (nonatomic, assign) BOOL isSysBackAnimation;


/*
 * 开始动画的视图
 */
@property (nonatomic, strong) UIView * startView;

/*
 * 结束动画的视图
 */
@property (nonatomic, strong) UIView * endView;

@end
