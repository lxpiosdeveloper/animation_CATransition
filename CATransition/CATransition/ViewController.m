//
//  ViewController.m
//  CATransition
//
//  Created by keymi on 2018/7/17.
//  Copyright © 2018年 Lee. All rights reserved.
//

#import "ViewController.h"
#import "CATransitionExtension.h"

static NSInteger const PicNum = 4;

@interface ViewController ()

@property (nonatomic, assign) CATExtensionType animationType;
@property (nonatomic, assign) CATOrientationType orientationType;
@property (nonatomic, assign) CATTimingFunctionType timingType;

@property (nonatomic, assign) int index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _animationType = CATExtensionTypeFade;
    _orientationType = CATOrientationTypeNone;
    _timingType = CATTimingFunctionDefault;
    
    [self changeBgImage];
}
- (IBAction)clickAnimationBtn:(UIButton*)sender {
    NSLog(@"%ld", sender.tag);
    switch (sender.tag) {
        case 1:
            _animationType = CATExtensionTypeFade;
            break;
        case 2:
            _animationType = CATExtensionTypeMoveIn;
            break;
        case 3:
            _animationType = CATExtensionTypePush;
            break;
        case 4:
            _animationType = CATExtensionTypeReveal;
            break;
        case 5:
            _animationType = CATExtensionTypeCube;
            break;
        case 6:
            _animationType = CATExtensionTypeSuckEffect;
            break;
        case 7:
            _animationType = CATExtensionTypeOglFlip;
            break;
        case 8:
            _animationType = CATExtensionTypeRippleEffect;
            break;
        case 9:
            _animationType = CATExtensionTypePageCurl;
            break;
        case 10:
            _animationType = CATExtensionTypePageUnCurl;
            break;
        case 11:
            _animationType = CATExtensionTypeCameraIrisHollowOpen;
            break;
        case 12:
            _animationType = CATExtensionTypeCameraIrisHollowClose;
            break;
        case 13:
            _animationType = CATExtensionTypeCurlDown;
            break;
        case 14:
            _animationType = CATExtensionTypeCurlUp;
            break;
        case 15:
            _animationType = CATExtensionTypeFlipFromLeft;
            break;
        case 16:
            _animationType = CATExtensionTypeFlipFromRight;
            break;
        default:
            break;
    }
    
    [CATransitionExtension transitionInView:self.view type:_animationType orientation:_orientationType timing:_timingType duration:0.f];
    
    [self changeBgImage];
}

- (IBAction)segmentValueChange:(UISegmentedControl*)sender {
    if (sender.tag == 100) {//Timing
        switch (sender.selectedSegmentIndex) {
            case 0:
                _timingType = CATTimingFunctionLinear;
                break;
            case 1:
                _timingType = CATTimingFunctionEaseIn;
                break;
            case 2:
                _timingType = CATTimingFunctionEaseOut;
                break;
            case 3:
                _timingType = CATTimingFunctionEaseInEaseOut;
                break;
            default:
                break;
        }
    }else{//
        switch (sender.selectedSegmentIndex) {
            case 0:
                _orientationType = CATOrientationTypeFromLeft;
                break;
            case 1:
                _orientationType = CATOrientationTypeFromBottom;
                break;
            case 2:
                _orientationType = CATOrientationTypeFromRight;
                break;
            case 3:
                _orientationType = CATOrientationTypeFromTop;
                break;
            default:
                break;
        }
    }
    NSLog(@"%ld--%ld", sender.tag, sender.selectedSegmentIndex);
}

-(void)changeBgImage{
    int tempIndex = _index;
    _index = arc4random() % PicNum;
    if (_index == tempIndex){
        if (_index == 0) _index++;
        if (_index == PicNum - 1) _index--;
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"bg%u", _index]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
