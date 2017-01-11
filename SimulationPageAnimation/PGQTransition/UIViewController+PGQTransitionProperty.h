//
//  UIViewController+PGQTransitionProperty.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/11/30.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PGQTransitionProperty;

@interface UIViewController (PGQTransitionProperty)

typedef void(^PGQTransitionBlock)(PGQTransitionProperty * transition);

@property (nonatomic, copy) PGQTransitionBlock    pgq_callBackTransition;
@property (nonatomic, assign) BOOL                pgq_delegateFlag;
@property (nonatomic, assign) BOOL                pgq_addTransitionFlag;

@property (nonatomic, weak) id                    pgq_transitioningDelegate;
@property (nonatomic, weak) id                    pgq_temNavDelegate;

@end
