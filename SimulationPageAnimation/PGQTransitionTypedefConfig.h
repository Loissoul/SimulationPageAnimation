//
//  PGQTransitionTypedefConfig.h
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/11/30.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#ifndef PGQTransitionTypedefConfig_h
#define PGQTransitionTypedefConfig_h

// ************** Enum **************
//MARK: - 动画类型
typedef NS_ENUM(NSInteger,PGQTransitionAnimationType){
    //----------- System ------------
    PGQTransitionAnimationTypeSysFade = 1,                //淡入淡出
    
    PGQTransitionAnimationTypeSysPushFromRight,
    PGQTransitionAnimationTypeSysPushFromLeft,
    PGQTransitionAnimationTypeSysPushFromTop,
    PGQTransitionAnimationTypeSysPushFromBottom,           //Push
    
    PGQTransitionAnimationTypeSysRevealFromRight,
    PGQTransitionAnimationTypeSysRevealFromLeft,
    PGQTransitionAnimationTypeSysRevealFromTop,
    PGQTransitionAnimationTypeSysRevealFromBottom,          //揭开
    
    PGQTransitionAnimationTypeSysMoveInFromRight,
    PGQTransitionAnimationTypeSysMoveInFromLeft,
    PGQTransitionAnimationTypeSysMoveInFromTop,
    PGQTransitionAnimationTypeSysMoveInFromBottom,          //覆盖
    
    PGQTransitionAnimationTypeSysCubeFromRight,
    PGQTransitionAnimationTypeSysCubeFromLeft,
    PGQTransitionAnimationTypeSysCubeFromTop,
    PGQTransitionAnimationTypeSysCubeFromBottom,            //立方体
    
    PGQTransitionAnimationTypeSysSuckEffect,                //吮吸
    
    PGQTransitionAnimationTypeSysOglFlipFromRight,
    PGQTransitionAnimationTypeSysOglFlipFromLeft,
    PGQTransitionAnimationTypeSysOglFlipFromTop,
    PGQTransitionAnimationTypeSysOglFlipFromBottom,         //翻转
    
    PGQTransitionAnimationTypeSysRippleEffect,              //波纹
    
    PGQTransitionAnimationTypeSysPageCurlFromRight,
    PGQTransitionAnimationTypeSysPageCurlFromLeft,
    PGQTransitionAnimationTypeSysPageCurlFromTop,
    PGQTransitionAnimationTypeSysPageCurlFromBottom,        //翻页
    
    PGQTransitionAnimationTypeSysPageUnCurlFromRight,
    PGQTransitionAnimationTypeSysPageUnCurlFromLeft,
    PGQTransitionAnimationTypeSysPageUnCurlFromTop,
    PGQTransitionAnimationTypeSysPageUnCurlFromBottom,      //反翻页
    
    PGQTransitionAnimationTypeSysCameraIrisHollowOpen,      //开镜头
    
    PGQTransitionAnimationTypeSysCameraIrisHollowClose,     //关镜头
    
    //----------- 自定义 ------------
    PGQTransitionAnimationTypeDefault,
    
    PGQTransitionAnimationTypePageTransition,
    
    PGQTransitionAnimationTypeViewMoveToNextVC,
    PGQTransitionAnimationTypeViewMoveNormalToNextVC,
    
    PGQTransitionAnimationTypeCover,
    
    PGQTransitionAnimationTypeSpreadFromRight,
    PGQTransitionAnimationTypeSpreadFromLeft,
    PGQTransitionAnimationTypeSpreadFromTop,
    PGQTransitionAnimationTypeSpreadFromBottom,
    PGQTransitionAnimationTypePointSpreadPresent,
    
    PGQTransitionAnimationTypeBoom,
    
    PGQTransitionAnimationTypeBrickOpenVertical,
    PGQTransitionAnimationTypeBrickOpenHorizontal,
    PGQTransitionAnimationTypeBrickCloseVertical,
    PGQTransitionAnimationTypeBrickCloseHorizontal,
    
    PGQTransitionAnimationTypeInsideThenPush,
    
    PGQTransitionAnimationTypeFragmentShowFromRight,
    PGQTransitionAnimationTypeFragmentShowFromLeft,
    PGQTransitionAnimationTypeFragmentShowFromTop,
    PGQTransitionAnimationTypeFragmentShowFromBottom,
    
    PGQTransitionAnimationTypeFragmentHideFromRight,
    PGQTransitionAnimationTypeFragmentHideFromLeft,
    PGQTransitionAnimationTypeFragmentHideFromTop,
    PGQTransitionAnimationTypeFragmentHideFromBottom,
    
};

//MARK: - 转场动作
typedef NS_ENUM(NSInteger,PGQTransitionType){
    
    PGQTransitionTypePop,
    PGQTransitionTypePush,
    PGQTransitionTypePresent,
    PGQTransitionTypeDismiss,
};

//MARK: - 方向
typedef NS_ENUM(NSInteger,PGQGestureType){
    
    PGQGestureTypeNone,
    PGQGestureTypePanLeft,
    PGQGestureTypePanRight,
    PGQGestureTypePanUp,
    PGQGestureTypePanDown,
    
};

//MARK: - 系统动画类型
typedef NS_ENUM(NSInteger,PGQTransitionSysAnimationType){
    
    PGQTransitionSysAnimationTypeFade = 1,                   //淡入淡出
    PGQTransitionSysAnimationTypePush,                       //推挤
    PGQTransitionSysAnimationTypeReveal,                     //揭开
    PGQTransitionSysAnimationTypeMoveIn,                     //覆盖
    PGQTransitionSysAnimationTypeCube,                       //立方体
    PGQTransitionSysAnimationTypeSuckEffect,                 //吮吸
    PGQTransitionSysAnimationTypeOglFlip,                    //翻转
    PGQTransitionSysAnimationTypeRippleEffect,               //波纹
    PGQTransitionSysAnimationTypePageCurl,                   //翻页
    PGQTransitionSysAnimationTypePageUnCurl,                 //反翻页
    PGQTransitionSysAnimationTypeCameraIrisHollowOpen,       //开镜头
    PGQTransitionSysAnimationTypeCameraIrisHollowClose,      //关镜头
    PGQTransitionSysAnimationTypeCurlDown,                   //下翻页
    PGQTransitionSysAnimationTypeCurlUp,                     //上翻页
    PGQTransitionSysAnimationTypeFlipFromLeft,               //左翻转
    PGQTransitionSysAnimationTypeFlipFromRight,              //右翻转
    
};


#endif /* PGQTransitionTypedefConfig_h */
