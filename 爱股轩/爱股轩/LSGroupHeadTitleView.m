//
//  LSGroupHeadTitleView.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGroupHeadTitleView.h"

@interface LSGroupHeadTitleView ()

@property (strong,nonatomic) UIImageView *logoIV;

@end

@implementation LSGroupHeadTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self addSubview:self.logoIV];
    }
    return self;
}

#pragma mark ==懒加载==
- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(40))];
        _logoIV.image = MImage(@"h2_tlt_02");
        _logoIV.contentMode =  UIViewContentModeScaleAspectFill;
    }
    return _logoIV;
}

@end
