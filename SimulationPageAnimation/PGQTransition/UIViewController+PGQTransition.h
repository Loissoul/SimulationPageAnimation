//
//  UIViewController+PGQTransition.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/12/2.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGQTransitionManager.h"
#import "PGQTransitionProperty.h"
#import "PGQPercentDrivenInteractiveTransition.h"
#import "UIViewController+PGQTransitionProperty.h"

@interface UIViewController (PGQTransition)<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>


- (void)pgq_presentViewController:(UIViewController *)viewControllerToPresent animationType:(PGQTransitionAnimationType )animationType completion:(void (^)(void))completion;
- (void)pgq_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(PGQTransitionBlock)transitionBlock;
- (void)pgq_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(PGQTransitionBlock)transitionBlock completion:(void (^)(void))completion;

@end
