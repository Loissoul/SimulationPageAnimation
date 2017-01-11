//
//  PGQTransitionProperty.m
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/11/30.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import "PGQTransitionProperty.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation PGQTransitionProperty

- (instancetype)init {
    self = [super init];
    if (self) {
        _animationTime = 0.40;
        self.animationType = PGQTransitionAnimationTypeDefault;
        _backGestureType = PGQGestureTypePanRight;
        _backGestureEnable = YES;
    }
    return self;
}

@end
