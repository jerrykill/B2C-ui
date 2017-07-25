//
//  LSShopLikeHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopLikeHeadView.h"

@interface LSShopLikeHeadView ()

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UILabel *titleLb;

@property (strong,nonatomic) UIImageView *leftIV;

@property (strong,nonatomic) UIImageView *rightIV;

@end

@implementation LSShopLikeHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.headIV];
    [self addSubview:self.titleLb];
    [self addSubview:self.leftIV];
    [self addSubview:self.rightIV];
}

#pragma mark ==懒加载==
- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(22))];
        _headIV.backgroundColor = [UIColor whiteColor];
    }
    return _headIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(150))/2, CGRectYH(_headIV)+AutoWidth(10), AutoWidth(150), AutoWidth(20))];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = __TextColor;
        _titleLb.font = MFont(AutoWidth(15));
        _titleLb.text = @"您可能感兴趣的产品";
    }
    return _titleLb;
}

- (UIImageView *)leftIV{
    if (!_leftIV) {
        _leftIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectYH(_headIV)+AutoWidth(19), (__kWidth-AutoWidth(150))/2, AutoWidth(1))];
        _leftIV.backgroundColor = LH_RGBCOLOR(210, 210, 210);
    }
    return _leftIV;
}

- (UIImageView *)rightIV{
    if (!_rightIV) {
        _rightIV = [[UIImageView alloc]initWithFrame:CGRectMake(__kWidth/2+AutoWidth(75), CGRectYH(_headIV)+AutoWidth(19), (__kWidth-AutoWidth(150))/2, AutoWidth(1))];
        _rightIV.backgroundColor = LH_RGBCOLOR(210, 210, 210);
    }
    return _rightIV;
}


@end
