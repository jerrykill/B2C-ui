//
//  UIView+GradientColor.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "UIView+GradientColor.h"


@implementation UIView (GradientColor)

@dynamic  gradientColor;

-(void)setGradientColor:(NSString *)gradientColor{
   CAGradientLayer *layers = [CAGradientLayer layer];
    layers.frame = self.bounds;
    layers.cornerRadius = self.layer.cornerRadius;
    [self.layer addSublayer:layers];
    layers.startPoint = CGPointMake(0, 0);
    layers.endPoint = CGPointMake(1, 0);
    layers.colors = @[(__bridge id)LH_RGBCOLOR(249, 121, 37).CGColor,(__bridge id)LH_RGBCOLOR(253, 77, 76).CGColor];
    layers.locations = @[@(0.0f),@(1.0f)];
}

@end
