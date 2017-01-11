//
//  PGQTransitionManager.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/12/1.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PGQTransitionTypedefConfig.h"

@interface PGQTransitionManager : NSObject<UIViewControllerAnimatedTransitioning, CAAnimationDelegate>

@property (nonatomic, assign) NSTimeInterval                    animationTime;
@property (nonatomic, assign) PGQTransitionType                 transitionType;
@property (nonatomic, assign) PGQTransitionAnimationType        animationType;
@property (nonatomic, assign) PGQTransitionAnimationType        backAnimationType;
@property (nonatomic, assign) PGQGestureType                    backGestureType;

@property (nonatomic, assign) BOOL                              isSysBackAnimation;
@property (nonatomic, assign) BOOL                              backGestureEnable;

@property (nonatomic, strong) UIView                            *startView;
@property (nonatomic, strong) UIView                            *targetView;


//block
@property (nonatomic, copy) void(^willEndInteractiveBlock)(BOOL success);
@property (nonatomic, copy) void(^completionBlock)();

+ (PGQTransitionManager *)copyPropertyFromObjcet:(id)object toObject:(id)targetObject;

@end
