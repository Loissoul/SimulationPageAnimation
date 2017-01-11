//
//  PGQPercentDrivenInteractiveTransition.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/12/2.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGQTransitionTypedefConfig.h"

typedef void(^ActionBlock)(void);

@interface PGQPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) PGQGestureType gestureType;
@property (nonatomic, assign) PGQTransitionType transitionType;
@property (nonatomic, readonly, assign) BOOL isInteractive;

@property (nonatomic, copy) ActionBlock presentBlock;
@property (nonatomic, copy) ActionBlock pushBlock;
@property (nonatomic, copy) ActionBlock popBlock;
@property (nonatomic, copy) ActionBlock dismissBlock;

@property (nonatomic, copy) void(^willEndInteractiveBlock)(BOOL success);

- (void)addGestureToViewController:(UIViewController*)vc;

@end
