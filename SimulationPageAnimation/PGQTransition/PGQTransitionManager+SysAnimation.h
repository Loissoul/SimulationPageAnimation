//
//  PGQTransitionManager+SysAnimation.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 17/1/11.
//  Copyright © 2017年 Lois_pan. All rights reserved.
//

#import "PGQTransitionManager.h"

@interface PGQTransitionManager (SysAnimation)

- (void)pgq_sysTransitionNextAnimationWithType: (PGQTransitionAnimationType)type context:(id <UIViewControllerContextTransitioning>)transitionContext;
- (void)pgq_sysTransitionBackAnimationWithType:(PGQTransitionAnimationType)type context:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
