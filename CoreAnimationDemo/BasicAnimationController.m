//
//  BasicAnimationController.m
//  CoreAnimationDemo
//
//  Created by ALittleNasty on 2017/2/15.
//  Copyright © 2017年 vcredit. All rights reserved.
//

#import "BasicAnimationController.h"

@interface BasicAnimationController ()

@property (nonatomic, weak) UIImageView *heartImage;

@end

@implementation BasicAnimationController


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
    [self.heartImage.layer removeAnimationForKey:@"scaleAnimation"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.heartImage.layer removeAnimationForKey:@"scaleAnimation"];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.toValue = @0;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.duration = 0.8;
    [self.heartImage.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

@end
