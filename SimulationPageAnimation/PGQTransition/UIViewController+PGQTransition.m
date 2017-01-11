//
//  UIViewController+PGQTransition.m
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/12/2.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import "UIViewController+PGQTransition.h"
#import <objc/runtime.h>
#import "UIViewController+PGQTransitionProperty.h"

UINavigationControllerOperation _operation;
PGQPercentDrivenInteractiveTransition *_interactive;
PGQTransitionManager *_transition;

@implementation UIViewController (PGQTransition)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method0 = class_getInstanceMethod(self.class, @selector(pgq_dismissViewControllerAnimated:completion:));
        Method method1 = class_getInstanceMethod(self.class, @selector(dismissViewControllerAnimated:completion:));
        method_exchangeImplementations(method0, method1);
    });
}

//MARK: - Action Method
- (void)pgq_presentViewController:(UIViewController *)viewControllerToPresent completion:(void(^)(void))completion {
    [self pgq_presentViewController:viewControllerToPresent makeTransition:nil completion:completion];
}

//MARK: - Choose AnimationType
- (void)pgq_presentViewController:(UIViewController *)viewControllerToPresent animationType:(PGQTransitionAnimationType )animationType completion:(void (^)(void))completion {

    [self pgq_presentViewController:viewControllerToPresent makeTransition:^(PGQTransitionProperty *transition) {
        transition.animationType = animationType;
    } completion:completion];
}

//make transition
- (void)pgq_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(PGQTransitionBlock)transitionBlock {
    [self pgq_presentViewController:viewControllerToPresent makeTransition:transitionBlock completion:nil];
}

- (void)pgq_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(PGQTransitionBlock)transitionBlock completion:(void (^)(void))completion{

    if (viewControllerToPresent.transitioningDelegate) {
        self.pgq_transitioningDelegate = viewControllerToPresent.transitioningDelegate;
    }
    viewControllerToPresent.pgq_addTransitionFlag = YES;
    viewControllerToPresent.transitioningDelegate = viewControllerToPresent;
    viewControllerToPresent.pgq_callBackTransition = transitionBlock ? transitionBlock : nil;
    [self presentViewController:viewControllerToPresent animated:YES completion:completion];
}

- (void)pgq_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    if (self.pgq_delegateFlag) {
        self.transitioningDelegate = self;
        if (self.pgq_transitioningDelegate) {
            self.transitioningDelegate = self.pgq_transitioningDelegate;
        }
    }
    [self pgq_dismissViewControllerAnimated:flag completion:completion];
}

//MARK: - delagate（UIViewControllerTransitioningDelegate,UINavigationControllerDelegate）
//MARK: - Present OR Dismiss
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    if (!self.pgq_addTransitionFlag) {
        return nil;
    }
    !_transition ? _transition = [[PGQTransitionManager alloc] init] : nil;
    PGQTransitionProperty *make = [[PGQTransitionProperty alloc] init];
    self.pgq_callBackTransition ? self.pgq_callBackTransition(make) : nil;
    _transition = [PGQTransitionManager copyPropertyFromObjcet :make toObject: _transition];
    _transition.transitionType = PGQTransitionTypePresent;
    self.pgq_delegateFlag = _transition.isSysBackAnimation ? NO : YES;
    return _transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {

    if (!self.pgq_addTransitionFlag) {
        return nil;
    }
    !_transition ? _transition = [[PGQTransitionManager alloc] init] : nil;
    PGQTransitionProperty * make = [[PGQTransitionProperty alloc] init];
    self.pgq_callBackTransition ? self.pgq_callBackTransition(make) : nil;
    _transition = [PGQTransitionManager copyPropertyFromObjcet: make toObject: _transition];
    _transition.transitionType = PGQTransitionTypePresent;
    self.pgq_delegateFlag = _transition.isSysBackAnimation ? NO : YES;
    return _transition;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{

    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{

    if (!self.pgq_addTransitionFlag) {
        
        return nil;
    }
    return _interactive.isInteractive ? _interactive : nil;
}

//MARK: - Push OR Pop
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {

    if (!self.pgq_addTransitionFlag) {
        return nil;
    }
    !_transition ? _transition = [[PGQTransitionManager alloc] init] : nil;
    PGQTransitionProperty *make = [[PGQTransitionProperty alloc] init];
    self.pgq_callBackTransition ? self.pgq_callBackTransition(make) : nil;
    _transition = [PGQTransitionManager copyPropertyFromObjcet:make toObject:_transition];
    _operation = operation;

    if (operation == UINavigationControllerOperationPush) {
        self.pgq_delegateFlag = _transition.isSysBackAnimation ? NO : YES;
        _transition.transitionType = PGQTransitionTypePush;
    } else {
        _transition.transitionType = PGQTransitionTypePop;
    }
    
    if (operation == UINavigationControllerOperationPush && _transition.isSysBackAnimation == NO && _transition.backGestureEnable) {
        
        !_interactive ? _interactive = [[PGQPercentDrivenInteractiveTransition alloc] init] : nil;
        [_interactive addGestureToViewController:self];
        _interactive.transitionType = PGQTransitionTypePop;
        _interactive.gestureType = _transition.backGestureType != PGQGestureTypeNone ? _transition.backGestureType : PGQGestureTypePanRight;
        _interactive.willEndInteractiveBlock = ^(BOOL success) {
        
            _transition.willEndInteractiveBlock ? _transition.willEndInteractiveBlock(success) : nil;
        };
    }
    return _transition;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {

    if (!self.pgq_addTransitionFlag) {
        
        return nil;
    }
    !_interactive ? _interactive = [[PGQPercentDrivenInteractiveTransition alloc] init] : nil;
    if (_operation == UINavigationControllerOperationPush) {
        
        return nil;
    } else {
    
        return _interactive.isInteractive ? _interactive : nil;
    }
}

@end
