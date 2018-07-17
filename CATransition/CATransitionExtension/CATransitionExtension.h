//
//  CATransitionExtension.h
//  CATransition
//
//  Created by keymi on 2018/7/17.
//  Copyright © 2018年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, CATExtensionType) {
    /* Common transition types */
    CATExtensionTypeFade                    = 1 << 0, //淡入淡出
    CATExtensionTypeMoveIn                  = 1 << 1, //覆盖
    CATExtensionTypePush                    = 1 << 2, //推出
    CATExtensionTypeReveal                  = 1 << 3, //揭开
    
    /* it is private */
    CATExtensionTypeCube                    = 1 << 4, //立方体翻转
    CATExtensionTypeSuckEffect              = 1 << 5, //吮吸
    CATExtensionTypeOglFlip                 = 1 << 6, //翻转
    CATExtensionTypeRippleEffect            = 1 << 7, //波纹
    CATExtensionTypePageCurl                = 1 << 8, //翻页
    CATExtensionTypePageUnCurl              = 1 << 9, //反翻页
    CATExtensionTypeCameraIrisHollowOpen    = 1 << 10, //摄像头打开
    CATExtensionTypeCameraIrisHollowClose   = 1 << 11, //摄像头关闭
    
    /* it is UIViewAnimationTransition */
    CATExtensionTypeCurlDown                = 1 << 12, //下翻页
    CATExtensionTypeCurlUp                  = 1 << 13, //上翻页
    CATExtensionTypeFlipFromLeft            = 1 << 14, //左翻转
    CATExtensionTypeFlipFromRight           = 1 << 15, //右翻转
};

typedef NS_ENUM(NSInteger, CATOrientationType) {
    /* Common transition subtypes. */
    CATOrientationTypeNone         = 0 ,
    CATOrientationTypeFromLeft     = 1 , //从左边
    CATOrientationTypeFromBottom   = 2 , //从下边
    CATOrientationTypeFromRight    = 3 , //从右边
    CATOrientationTypeFromTop      = 4 , //从上边
};

typedef NS_ENUM(NSInteger, CATTimingFunctionType) {
    /** Timing function names. **/
    CATTimingFunctionDefault       = 0 ,
    CATTimingFunctionLinear        = 1 ,
    CATTimingFunctionEaseIn        = 2 ,
    CATTimingFunctionEaseOut       = 3 ,
    CATTimingFunctionEaseInEaseOut = 4 ,
};

@interface CATransitionExtension : NSObject

+(void)transitionInView:(UIView*)view type:(CATExtensionType)type orientation:(CATOrientationType)orientation timing:(CATTimingFunctionType)timing duration:(CFTimeInterval)duration;

@end

/*
 动画类型         说明                   对应常量            是否支持方向设置
 公开API
 fade           淡出效果                kCATransitionFade        是
 movein         新视图移动到旧视图上      kCATransitionMoveIn      是
 push           新视图推出旧视图         kCATransitionPush        是
 reveal         移开旧视图显示新视图      kCATransitionReveal      是
 私有API         私有API只能通过字符串访问
 cube           立方体翻转效果            无                      是
 oglFlip        翻转效果                 无                      是
 suckEffect     收缩效果                 无                      否
 rippleEffect   水滴波纹效果              无                      否
 pageCurl       向上翻页效果              无                      是
 pageUnCurl     向下翻页效果              无                      是
 cameralIrisHollowOpen    摄像头打开效果  无                       否
 cameraIrisHollowClose    摄像头关闭效果  无                       否

 */

/*
 动画子类型    说明
 kCATransitionFromRight     从右侧转场
 kCATransitionFromLeft      从左侧转场
 kCATransitionFromTop       从顶部转场
 kCATransitionFromBottom    从底部转场
 */
