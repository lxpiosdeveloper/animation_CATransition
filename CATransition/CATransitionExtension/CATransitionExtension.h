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
    CATExtensionTypeFade                    = 1 << 1, //淡入淡出
    CATExtensionTypeMoveIn                  = 1 << 2, //覆盖
    CATExtensionTypePush                    = 1 << 3, //推出
    CATExtensionTypeReveal                  = 1 << 4, //揭开
    
    /* it is private */
    CATExtensionTypeCube                    = 1 << 5, //立方体翻转
    CATExtensionTypeSuckEffect              = 1 << 6, //吮吸
    CATExtensionTypeOglFlip                 = 1 << 7, //翻转
    CATExtensionTypeRippleEffect            = 1 << 8, //波纹
    CATExtensionTypePageCurl                = 1 << 9, //翻页
    CATExtensionTypePageUnCurl              = 1 << 10, //反翻页
    CATExtensionTypeCameraIrisHollowOpen    = 1 << 11, //摄像头打开
    CATExtensionTypeCameraIrisHollowClose   = 1 << 12, //摄像头关闭
    
    /* it is UIViewAnimationTransition */
    CATExtensionTypeCurlDown                = 1 << 13, //下翻页
    CATExtensionTypeCurlUp                  = 1 << 14, //上翻页
    CATExtensionTypeFlipFromLeft            = 1 << 15, //左翻转
    CATExtensionTypeFlipFromRight           = 1 << 16, //右翻转
    
    /* Common transition subtypes. */
    CATOrientationExtensionTypeNone         = 1 << 20, //从左边
    CATOrientationExtensionTypeFromLeft     = 2 << 20, //从左边
    CATOrientationExtensionTypeFromBottom   = 3 << 20, //从下边
    CATOrientationExtensionTypeFromRight    = 4 << 20, //从右边
    CATOrientationExtensionTypeFromTop      = 5 << 20, //从上边
    
    /** Timing function names. **/
    CATExtensionTimingFunctionDefault       = 1 << 21,
    CATExtensionTimingFunctionLinear        = 2 << 21,
    CATExtensionTimingFunctionEaseIn        = 3 << 21,
    CATExtensionTimingFunctionEaseOut       = 4 << 21,
    CATExtensionTimingFunctionEaseInEaseOut = 5 << 21,
};

typedef NS_ENUM(NSInteger, CATExtensionType) ;

@interface CATransitionExtension : NSObject

+(void)transitionInView:(UIView*)view type:(CATExtensionType)type duration:(CFTimeInterval)duration;

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
