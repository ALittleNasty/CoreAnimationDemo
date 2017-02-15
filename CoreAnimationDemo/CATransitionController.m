//
//  CATransitionController.m
//  CoreAnimationDemo
//
//  Created by ALittleNasty on 2017/2/15.
//  Copyright © 2017年 vcredit. All rights reserved.
//

#import "CATransitionController.h"

static const NSTimeInterval kAnimationDuration = 2.0;

@interface CATransitionController ()

/** 图片 */
@property (nonatomic, weak) UIImageView *imageView;
/** 图片数组 */
@property (nonatomic, copy) NSArray *imageArray;
/** 专场动画动画类型数组 */
@property (nonatomic, copy) NSArray *animationTypes;
/** 专场动画转场类型数组 */
@property (nonatomic, copy) NSArray *animationSubtypes;
/** 当前图片图片索引 */
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation CATransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGRect frame = CGRectMake(0.f, 64.f, screenWidth, (screenHeight - 64.f));
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = self.imageArray.firstObject;
    imageView.frame = frame;
    imageView.userInteractionEnabled = YES ;
    
    // 添加轻扫手势
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft ;
    [imageView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight ;
    [imageView addGestureRecognizer:swipeRight];
    
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

#pragma mark - Action

- (void)swipeLeftAction:(UISwipeGestureRecognizer *)gesture
{
    _currentIndex ++ ;
    if (_currentIndex == self.imageArray.count) {
        _currentIndex = 0 ;
    }
    
    [self addAnimationWithIndex:_currentIndex];
}

- (void)swipeRightAction:(UISwipeGestureRecognizer *)gesture
{
    _currentIndex -- ;
    if (_currentIndex == -1) {
        _currentIndex = self.imageArray.count - 1 ;
    }
    
    [self addAnimationWithIndex:_currentIndex];
}

#pragma mark - Util

- (void)addAnimationWithIndex:(NSInteger)index
{
    _imageView.image = self.imageArray[index] ;
    
    CATransition *animation = [CATransition animation] ;
    
    animation.type = self.animationTypes[index];
    
    animation.subtype = self.animationSubtypes[index];
    
    animation.duration = kAnimationDuration ;
    
    [self.imageView.layer addAnimation:animation forKey:nil];
}

#pragma mark - Lazy Load

- (NSArray *)imageArray
{
    if (!_imageArray) {
        
        _imageArray = @[[UIImage imageNamed:@"01.jpg"],
                        [UIImage imageNamed:@"02.jpg"],
                        [UIImage imageNamed:@"03.jpg"],
                        [UIImage imageNamed:@"04.jpg"],
                        [UIImage imageNamed:@"05.jpg"],];
    }
    
    return _imageArray;
}

- (NSArray *)animationTypes
{
    if (!_animationTypes) {
        
        _animationTypes = @[kCATransitionFade,
                            kCATransitionMoveIn,
                            kCATransitionPush,
                            kCATransitionReveal,
                            @"cube"];
    }
    
    return _animationTypes;
}

- (NSArray *)animationSubtypes
{
    if (!_animationSubtypes) {
        
        _animationSubtypes = @[kCATransitionFromTop,
                               kCATransitionFromBottom,
                               kCATransitionFromLeft,
                               kCATransitionFromRight,
                               kCATransitionFromTop];
    }
    
    return _animationSubtypes;
}

@end
