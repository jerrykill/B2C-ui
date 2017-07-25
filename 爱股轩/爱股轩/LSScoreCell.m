//
//  LSScoreCell.m
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSScoreCell.h"
#import "LSIntegralGoodView.h"


@interface LSScoreCell ()

@property (strong,nonatomic) UIImageView *integralIV;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) LSIntegralGoodView *goodOneV;

@property (strong,nonatomic) LSIntegralGoodView *goodTwoV;

@property (strong,nonatomic) LSIntegralGoodView *goodThreeV;

@end

@implementation LSScoreCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.integralIV];
    [self addSubview:self.goodOneV];
    [self addSubview:self.goodTwoV];
    [self addSubview:self.goodThreeV];
    [self addSubview:self.logoIV];
    
}

#pragma mark ==懒加载==
- (UIImageView *)integralIV{
    if (!_integralIV) {
        _integralIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(150))];
        _integralIV.backgroundColor = LH_RandomColor;
        _integralIV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseIntegral)];
        [_integralIV addGestureRecognizer:tap];
    }
    return _integralIV;
}

- (LSIntegralGoodView *)goodOneV{
    if (!_goodOneV) {
        _goodOneV = [[LSIntegralGoodView alloc]initWithFrame:CGRectMake(0, CGRectYH(_integralIV), __kWidth/3, AutoWidth(114))];
        _goodOneV.title = @"学习终端";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseGoodOne)];
        [_goodOneV addGestureRecognizer:tap];
    }
    return _goodOneV;
}

- (LSIntegralGoodView *)goodTwoV{
    if (!_goodTwoV) {
        _goodTwoV = [[LSIntegralGoodView alloc]initWithFrame:CGRectMake(CGRectXW(_goodOneV), CGRectYH(_integralIV), __kWidth/3, AutoWidth(114))];
        _goodTwoV.title = @"培训课程";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseGoodTwo)];
        [_goodTwoV addGestureRecognizer:tap];
    }
    return _goodTwoV;
}

- (LSIntegralGoodView *)goodThreeV{
    if (!_goodThreeV) {
        _goodThreeV = [[LSIntegralGoodView alloc]initWithFrame:CGRectMake(CGRectXW(_goodTwoV), CGRectYH(_integralIV), __kWidth/3, AutoWidth(114))];
        _goodThreeV.title = @"股票书籍";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseGoodThree)];
        [_goodThreeV addGestureRecognizer:tap];
    }
    return _goodThreeV;
}

- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectYH(_goodThreeV)+AutoWidth(11), __kWidth, AutoWidth(100))];
        _logoIV.backgroundColor = LH_RandomColor;
        _logoIV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseLogo)];
        [_logoIV addGestureRecognizer:tap];

    }
    return _logoIV;
}

- (void)chooseIntegral{
    [self.delegate integralChooseAction:0];
}

- (void)chooseGoodOne{
    [self.delegate integralChooseAction:1];
}

- (void)chooseGoodTwo{
    [self.delegate integralChooseAction:2];
}

- (void)chooseGoodThree{
    [self.delegate integralChooseAction:3];
}

- (void)chooseLogo{
    [self.delegate integralChooseAction:4];
}

@end
