//
//  CAAnimationGroupController.m
//  CoreAnimationDemo
//
//  Created by ALittleNasty on 2017/2/15.
//  Copyright © 2017年 vcredit. All rights reserved.
//

#import "CAAnimationGroupController.h"

@interface CAAnimationGroupController ()

@property (nonatomic, weak) UIImageView *heartImage;

@end

@implementation CAAnimationGroupController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGRect frame = CGRectMake((screenWidth - 100) * 0.5, (screenHeight - 100) * 0.5, 100.f, 100.f);
    
    UIImageView *heartImage = [[UIImageView alloc] init];
    heartImage.image = [UIImage imageNamed:@"heart.jpeg"];
    heartImage.layer.cornerRadius = 50.f;
    heartImage.clipsToBounds = YES;
    heartImage.frame = frame;
    [self.view addSubview:heartImage];
    self.heartImage = heartImage;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.heartImage.layer removeAnimationForKey:@"groupAnimation"];
}

#pragma mark - Action

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.heartImage.layer removeAnimationForKey:@"groupAnimation"];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    
    // 缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.toValue = @0;
    
    // 透明度动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animation];
    opacityAnimation.keyPath = @"opacity";
    opacityAnimation.toValue = @0.0;
    
    groupAnimation.duration = 2.0;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.animations = @[scaleAnimation, opacityAnimation];
    [self.heartImage.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

@end
