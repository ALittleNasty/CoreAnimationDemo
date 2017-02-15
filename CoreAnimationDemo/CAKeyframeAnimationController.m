//
//  CAKeyframeAnimationController.m
//  CoreAnimationDemo
//
//  Created by ALittleNasty on 2017/2/15.
//  Copyright © 2017年 vcredit. All rights reserved.
//

#import "CAKeyframeAnimationController.h"


#define AngleToRadius(angle)  (angle / 180.0 * M_PI)

@interface CAKeyframeAnimationController ()

@property (nonatomic, weak) UIImageView *heartImage;

@end

@implementation CAKeyframeAnimationController

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
    [self.heartImage.layer removeAnimationForKey:@"rotationAnimation"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.heartImage.layer removeAnimationForKey:@"rotationAnimation"];
    
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animation];
    rotationAnimation.keyPath = @"transform.rotation";
    rotationAnimation.values = @[@(AngleToRadius(90)), @(AngleToRadius(180)), @(AngleToRadius(270)), @(AngleToRadius(360))];
    rotationAnimation.duration = 1.5;
    rotationAnimation.repeatCount = 1;
    [self.heartImage.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}



@end
