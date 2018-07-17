//
//  CATransitionExtension.m
//  CATransition
//
//  Created by keymi on 2018/7/17.
//  Copyright © 2018年 Lee. All rights reserved.
//

#import "CATransitionExtension.h"

@implementation CATransitionExtension

+(void)transitionInView:(UIView *)view type:(CATExtensionType)type duration:(CFTimeInterval)duration{
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
        if (type & CATOrientationExtensionTypeFromLeft) {
            subTypeString = kCATransitionFromLeft;
        }else if (type & CATOrientationExtensionTypeFromBottom){
            subTypeString = kCATransitionFromBottom;
        }else if (type & CATOrientationExtensionTypeFromRight){
            subTypeString = kCATransitionFromRight;
        }else if (type & CATOrientationExtensionTypeFromTop){
            subTypeString = kCATransitionFromTop;
        }
        if (subTypeString) {
            animation.subtype = subTypeString;
        }
        
        //设置动画速度
        NSString* timingFunction = kCAMediaTimingFunctionDefault;
        if (type & CATExtensionTimingFunctionLinear) {
            subTypeString = kCAMediaTimingFunctionLinear;
        }else if (type & CATExtensionTimingFunctionEaseIn){
            subTypeString = kCAMediaTimingFunctionEaseIn;
        }else if (type & CATExtensionTimingFunctionEaseOut){
            subTypeString = kCAMediaTimingFunctionEaseOut;
        }else if (type & CATExtensionTimingFunctionEaseInEaseOut){
            subTypeString = kCAMediaTimingFunctionEaseInEaseOut;
        }
        animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
        
        [view.layer addAnimation:animation forKey:@"animation"];
    }
}

@end
