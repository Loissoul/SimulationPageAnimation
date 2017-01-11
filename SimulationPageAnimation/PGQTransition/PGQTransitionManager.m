//
//  PGQTransitionManager.m
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/12/1.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import "PGQTransitionManager.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "PGQTransitionProperty.h"

#import "PGQTransitionManager+SysAnimation.h"

@interface PGQTransitionManager()

@property (nonatomic, copy) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation PGQTransitionManager

- (instancetype)init {

    self = [super init];
    if (self) {
        _completionBlock = nil;
    }
    return self;
}

//MARK: - UIViewControllerContextTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {

    return _animationTime;
}

- (void)animationEnded:(BOOL)transitionCompleted {
    
    //动画结束的时候移除相关的代理
    if (transitionCompleted) {
        [self removeDelegate];
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    _transitionContext = transitionContext;
    if (self.animationType == PGQTransitionAnimationTypeDefault) {
        self.animationType = PGQTransitionAnimationTypeSysPushFromLeft;
    }
    switch (_transitionType) {
        case PGQTransitionTypePush:
        case PGQTransitionTypePresent:
            [self transitionActionAnimation:transitionContext withAnimationType:self.animationType];
            break;
        case PGQTransitionTypePop:
        case PGQTransitionTypeDismiss:
            [self transitionBackAnimation:transitionContext withAnimationType:self.animationType];
            break;
        default:
            break;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    if (flag) {
        _completionBlock ? _completionBlock() : nil;
        _completionBlock = nil;
    }
}

//MARK: - Action
//MARK: - 动态发送方法
- (void)transitionActionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(PGQTransitionAnimationType)animationType {
    if ((NSInteger)animationType < (NSInteger)PGQTransitionAnimationTypeDefault) {
        [self sysTransitionAnimationWithType:animationType  context:transitionContext];
    }
    unsigned int count = 0;
    Method *methodList = class_copyMethodList([PGQTransitionManager class], &count);
    int tag = 0;
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL selector = method_getName(method);
        NSString *methonName = NSStringFromSelector(selector);
        if ([methonName rangeOfString:@"NextTransitionAnimation"].location != NSNotFound) {
            tag++;
            if (tag == animationType - PGQTransitionAnimationTypeDefault) {
                ((void (*)(id,SEL,id<UIViewControllerContextTransitioning>,PGQTransitionAnimationType))objc_msgSend)(self,selector,transitionContext,animationType);
            }
        }
    }
}

- (void)transitionBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(PGQTransitionAnimationType)animationType {
    if ((NSInteger) animationType < (NSInteger)PGQTransitionAnimationTypeDefault) {
        [self backSysTransitionAnimationWithType:animationType context:transitionContext];
    }
    unsigned int count = 0;
    Method *methodList = class_copyMethodList([PGQTransitionManager class], &count);
    int tag = 0;
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL selector = method_getName(method);
        NSString * methodName = NSStringFromSelector(selector);
        if ([methodName rangeOfString:@"BackTransitionAnimation"].location != NSNotFound) {
            tag++;
            if (tag == animationType - PGQTransitionAnimationTypeDefault) {
                ((void (*)(id, SEL, id<UIViewControllerContextTransitioning>, PGQTransitionAnimationType))objc_msgSend)(self, selector, transitionContext, animationType);
            }
        }
    }
}

//MARK: - Animations
#warning 这里面添加自定义的转场动画，方法名字包含 @"BackTransitionAnimation" 或者 @"NextTransitionAnimation" 定义扩展实现 根据transitionContext
-(void)sysTransitionAnimationWithType:(PGQTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self pgq_sysTransitionNextAnimationWithType:type context:transitionContext];
}

-(void)backSysTransitionAnimationWithType:(PGQTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self pgq_sysTransitionBackAnimationWithType:type context:transitionContext];
}


//MARK: - other
- (void)removeDelegate {
    UIViewController * fromVC = [_transitionContext viewControllerForKey: UITransitionContextFromViewControllerKey];
    UIViewController * toVC = [_transitionContext viewControllerForKey: UITransitionContextToViewControllerKey];
    UIView * containView = [_transitionContext containerView];
    
    void (^RemoveDelegateBlock)() = ^(){
        fromVC.transitioningDelegate = nil;
        fromVC.navigationController.delegate = nil;
        toVC.transitioningDelegate = nil;
        toVC.navigationController.delegate = nil;
    };
    
    switch (self.transitionType) {
        case PGQTransitionTypePush:
        case PGQTransitionTypePresent: {
            if (self.isSysBackAnimation) {
                RemoveDelegateBlock ? RemoveDelegateBlock():nil;
            }
            containView = nil;
        }
            break;
            
        default: {
        
            RemoveDelegateBlock ? RemoveDelegateBlock():nil;
            containView = nil;
        }
            break;
    }
}

//MARK: - 设置AnimationType
- (void)setAnimationType:(PGQTransitionAnimationType)animationType {

    _animationType = animationType;
}

+ (PGQTransitionManager *)copyPropertyFromObjcet:(id)object toObject:(id)targetObject {
    PGQTransitionProperty * property = object;
    PGQTransitionManager *transition = targetObject;
    
    transition.animationTime = property.animationTime;
    transition.animationType = property.animationType;
    transition.transitionType = property.transitionType;
    transition.isSysBackAnimation = property.isSysBackAnimation;
    transition.backGestureType = property.backGestureType;
    transition.backGestureEnable = property.backGestureEnable;
    transition.startView = property.startView;
    transition.targetView = property.endView;
    
    return transition;
}

@end
