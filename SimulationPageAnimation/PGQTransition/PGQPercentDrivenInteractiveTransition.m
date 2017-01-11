//
//  PGQPercentDrivenInteractiveTransition.m
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/12/2.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import "PGQPercentDrivenInteractiveTransition.h"

@interface PGQPercentDrivenInteractiveTransition(){

    BOOL _isInter;
}

@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CGFloat percent;

@end

@implementation PGQPercentDrivenInteractiveTransition

- (void)addGestureToViewController:(UIViewController *)vc {

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    self.vc = vc;
    [vc.view addGestureRecognizer:pan];
}

- (void)panAction:(UIPanGestureRecognizer *)pan {

    _percent = 0.0;
    CGFloat totalWidth = pan.view.bounds.size.width;
    CGFloat totalHeight = pan.view.bounds.size.height;
    switch (self.gestureType) {
        case PGQGestureTypePanLeft: {
            CGFloat x = [pan translationInView:pan.view].x;
            _percent = -x/totalWidth;
        }
            break;
        case PGQGestureTypePanRight: {
            CGFloat x = [pan translationInView:pan.view].x;
            _percent = x/totalWidth;
        }
            break;
        case PGQGestureTypePanDown: {
            CGFloat y = [pan translationInView:pan.view].y;
            _percent = y/totalHeight;
        }
            break;
        case PGQGestureTypePanUp: {
            CGFloat y = [pan translationInView:pan.view].y;
            _percent = -y/totalHeight;
        }
            break;
        default:
            break;
    }
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:{
            _isInter = YES;
            [self beganGeture];
        }
            break;
        case UIGestureRecognizerStateChanged:{
            [self updateInteractiveTransition:_percent];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            _isInter = NO;
            [self continueAction];
        }
            break;
            
        default:
            break;
    }
}

- (void)beganGeture {
    switch (_transitionType) {
        case PGQTransitionTypePresent:{
            
            _presentBlock ? _presentBlock() : nil;
        }
            break;
        case PGQTransitionTypeDismiss:{
            
            _dismissBlock ? _dismissBlock() : nil;
        }
            break;
        case PGQTransitionTypePush:{
            
            _pushBlock ? _pushBlock() : nil;
        }
            break;
        case PGQTransitionTypePop:{
            
            _popBlock ? _popBlock() : nil;
        }
            break;
        default:
            break;
    }
}

- (void)continueAction{
    if (_displayLink) {
        return;
    }
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeUIAction)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)changeUIAction {
    CGFloat timeDistance = 2.0/6.0;
    
    if (_percent > 0.35) {
        _percent += timeDistance;
    } else {
        _percent -= timeDistance;
    }
    [self updateInteractiveTransition:_percent];
    
    if (_percent >= 1.0) {
        
        _willEndInteractiveBlock ? _willEndInteractiveBlock(YES) : nil;
        [self finishInteractiveTransition];
        [_displayLink invalidate];
        _displayLink = nil;
    }
    if (_percent <= 0) {
        
        _willEndInteractiveBlock ? _willEndInteractiveBlock(NO) : nil;
        [_displayLink invalidate];
        _displayLink = nil;
        [self cancelInteractiveTransition];
    }
    
}

@end
