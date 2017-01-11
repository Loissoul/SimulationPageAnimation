//
//  UIViewController+PGQTransitionProperty.m
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/11/30.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import "UIViewController+PGQTransitionProperty.h"
#import <objc/runtime.h>

static NSString * pgq_callBackTransitionKey    = @"CallBackTransitionKey";
static NSString * pgq_delegateFlagKey          = @"pgq_DelegateFlagKey";
static NSString * pgq_addTransitionFlagKey     = @"pgq_addTransitionFlagKey";
static NSString * pgq_transitioningDelegateKey = @"pgq_transitioningDelegateKey";
static NSString * pgq_tempNavDelegateKey       = @"pgq_tempNavDelegateKey";

@implementation UIViewController (PGQTransitionProperty)

//MARK: - property

//MARK: - pgq_callBackTransition
- (void)setPgq_callBackTransition:(PGQTransitionBlock)pgq_callBackTransition {
    objc_setAssociatedObject(self, &pgq_callBackTransitionKey, pgq_callBackTransition, OBJC_ASSOCIATION_COPY);
}

- (PGQTransitionBlock)pgq_callBackTransition {
    return objc_getAssociatedObject(self, &pgq_callBackTransitionKey);
}

//MARK: - pgq_delegateFlag
- (void)setPgq_delegateFlag:(BOOL)pgq_delegateFlag {
    objc_setAssociatedObject(self, &pgq_delegateFlagKey, @(pgq_delegateFlag), OBJC_ASSOCIATION_COPY);
}

- (BOOL)pgq_delegateFlag {
    return objc_getAssociatedObject(self, &pgq_delegateFlagKey);
}

//MARK: - pgq_addTransitionFlag
- (void)setPgq_addTransitionFlag:(BOOL)pgq_addTransitionFlag {
    objc_setAssociatedObject(self, &pgq_addTransitionFlagKey, @(pgq_addTransitionFlag), OBJC_ASSOCIATION_COPY);
}

- (BOOL)pgq_addTransitionFlag {
    return objc_getAssociatedObject(self, &pgq_addTransitionFlagKey);
}

//MARK: - pgq_transitioningDelegate
-(void)setPgq_transitioningDelegate:(id)pgq_transitioningDelegate {
    objc_setAssociatedObject(self, &pgq_transitioningDelegateKey, pgq_transitioningDelegate, OBJC_ASSOCIATION_COPY);
}

- (id)pgq_transitioningDelegate {
    return objc_getAssociatedObject(self, &pgq_transitioningDelegateKey);
}

//MARK: - pgq_temNavDelegate
- (void)setPgq_temNavDelegate:(id)pgq_temNavDelegate {
    objc_setAssociatedObject(self, &pgq_tempNavDelegateKey, pgq_temNavDelegate, OBJC_ASSOCIATION_COPY);
}

- (id)pgq_temNavDelegate {

    return objc_getAssociatedObject(self, &pgq_tempNavDelegateKey);
}
@end
