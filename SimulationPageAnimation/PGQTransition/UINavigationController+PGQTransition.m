//
//  UINavigationController+PGQTransition.m
//  SimulationPageAnimation
//
//  Created by Lois_pan on 17/1/11.
//  Copyright © 2017年 Lois_pan. All rights reserved.
//

#import "UINavigationController+PGQTransition.h"
#import <objc/runtime.h>
#import "UIViewController+PGQTransitionProperty.h"

@implementation UINavigationController (PGQTransition)

//利用swizzling 替换原生的popViewControllerAnimated 方法
//MARK: - hook
+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getInstanceMethod(self.class, @selector(popViewControllerAnimated:));
        Method method2 = class_getInstanceMethod(self.class, @selector(pgq_popViewControllerAnimated:));
        method_exchangeImplementations(method1, method2);
    });
}

//MARK: - Action
- (void)pgq_pushViewController:(UIViewController *)viewController {

    [self pgq_pushViewController:viewController makeTransition:nil];
}

- (void)pgq_pushViewController:(UIViewController *)viewController animateType:(PGQTransitionAnimationType) animateType {
    
    [self pgq_pushViewController:viewController makeTransition:^(PGQTransitionProperty *transition) {
        transition.animationType = animateType;
    }];
}

- (void)pgq_pushViewController:(UIViewController *)viewController makeTransition:(PGQTransitionBlock)transitionBlock {

    if (self.delegate) {
        viewController.pgq_temNavDelegate = self.delegate;
    }
    self.delegate = viewController;
    viewController.pgq_addTransitionFlag = YES;
    viewController.pgq_callBackTransition = transitionBlock ? transitionBlock : nil;
    [self pushViewController:viewController animated:self];
}

- (UIViewController *)pgq_popViewControllerAnimated:(BOOL)animated {
    if (self.viewControllers.lastObject.pgq_delegateFlag) {
        self.delegate = self.viewControllers.lastObject;
        if (self.pgq_temNavDelegate) {
            self.delegate = self.pgq_temNavDelegate;
        }
    }
    return [self pgq_popViewControllerAnimated:animated];
}

@end
