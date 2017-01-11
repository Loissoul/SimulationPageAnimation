//
//  UINavigationController+PGQTransition.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 17/1/11.
//  Copyright © 2017年 Lois_pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGQTransitionTypedefConfig.h"
#import "UIViewController+PGQTransition.h"

@interface UINavigationController (PGQTransition)

- (void)pgq_pushViewController:(UIViewController *)viewController animateType:(PGQTransitionAnimationType) animateType;

- (void)pgq_pushViewController:(UIViewController *)viewController makeTransition:(PGQTransitionBlock)transitionBlock;

@end
