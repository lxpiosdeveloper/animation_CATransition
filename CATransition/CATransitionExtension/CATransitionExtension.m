//
//  CATransitionExtension.m
//  CATransition
//
//  Created by keymi on 2018/7/17.
//  Copyright © 2018年 Lee. All rights reserved.
//

#import "CATransitionExtension.h"

@implementation CATransitionExtension

+(void)transitionInView:(UIView *)view type:(CATExtensionType)type orientation:(CATOrientationType)orientation timing:(CATTimingFunctionType)timing duration:(CFTimeInterval)duration{
    if (type & CATExtensionTypeCurlDown || type & CATExtensionTypeCurlUp || type & CATExtensionTypeFlipFromLeft || type & CATExtensionTypeFlipFromRight) {
        UIViewAnimationTransition transition = UIViewAnimationTransitionNone;
        if (type & CATExtensionTypeCurlDown) {
            transition = UIViewAnimationTransitionCurlDown;
        }else if (type & CATExtensionTypeCurlUp){
            transition = UIViewAnimationTransitionCurlUp;
        }else if (type & CATExtensionTypeFlipFromLeft){
            transition = UIViewAnimationTransitionFlipFromLeft;
        }else if (type & CATExtensionTypeFlipFromRight){
            transition = UIViewAnimationTransitionFlipFromRight;
        }
        [UIView animateWithDuration:duration ? duration : 0.7f animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationTransition:transition forView:view cache:YES];
        }];
    }else{
        //创建CATransition对象
        CATransition *animation = [CATransition animation];
        //设置动画时间
        animation.duration = duration ? duration : 0.7f;
        //设置动画type
        NSString* typeString = kCATransitionFade;
        if (type & CATExtensionTypeFade) {
            typeString = kCATransitionFade;
        }else if (type & CATExtensionTypeMoveIn){
            typeString = kCATransitionMoveIn;
        }else if (type & CATExtensionTypePush){
            typeString = kCATransitionPush;
        }else if (type & CATExtensionTypeReveal){
            typeString = kCATransitionReveal;
        }else if (type & CATExtensionTypeCube){
            typeString = @"cube";
        }else if (type & CATExtensionTypeSuckEffect){
            typeString = @"suckEffect";
        }else if (type & CATExtensionTypeOglFlip){
            typeString = @"oglFlip";
        }else if (type & CATExtensionTypeRippleEffect){
            typeString = @"rippleEffect";
        }else if (type & CATExtensionTypePageCurl){
            typeString = @"pageCurl";
        }else if (type & CATExtensionTypePageUnCurl){
            typeString = @"pageUnCurl";
        }else if (type & CATExtensionTypeCameraIrisHollowOpen){
            typeString = @"cameraIrisHollowOpen";
        }else if (type & CATExtensionTypeCameraIrisHollowClose){
            typeString = @"cameraIrisHollowClose";
        }
        animation.type = typeString;
        
        //设置动画subType
        NSString *subTypeString = nil;
        if (orientation == CATOrientationTypeFromLeft) {
            subTypeString = kCATransitionFromLeft;
        }else if (orientation == CATOrientationTypeFromBottom){
            subTypeString = kCATransitionFromBottom;
        }else if (orientation == CATOrientationTypeFromRight){
            subTypeString = kCATransitionFromRight;
        }else if (orientation == CATOrientationTypeFromTop){
            subTypeString = kCATransitionFromTop;
        }
        if (subTypeString) {
            animation.subtype = subTypeString;
        }
        
        //设置动画速度
        NSString* timingFunction = kCAMediaTimingFunctionDefault;
        if (timing == CATTimingFunctionLinear) {
            timingFunction = kCAMediaTimingFunctionLinear;
        }else if (timing == CATTimingFunctionEaseIn){
            timingFunction = kCAMediaTimingFunctionEaseIn;
        }else if (timing == CATTimingFunctionEaseOut){
            timingFunction = kCAMediaTimingFunctionEaseOut;
        }else if (timing == CATTimingFunctionEaseInEaseOut){
            timingFunction = kCAMediaTimingFunctionEaseInEaseOut;
        }
        animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
        
        [view.layer addAnimation:animation forKey:@"animation"];
    }
}

@end
