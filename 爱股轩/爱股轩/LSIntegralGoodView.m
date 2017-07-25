//
//  LSIntegralGoodView.m
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSIntegralGoodView.h"

@interface LSIntegralGoodView ()

@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) UILabel *titleLabel;

@end

@implementation LSIntegralGoodView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.goodIV];
    [self addSubview:self.titleLabel];
}

#pragma mark ==懒加载==
- (UIImageView *)goodIV{
    if (!_goodIV) {
        _goodIV =[[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(15), AutoWidth(10), __kWidth/3-AutoWidth(30), AutoWidth(65))];
        _goodIV.backgroundColor = LH_RandomColor;
    }
    return _goodIV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(0), CGRectYH(_goodIV)+AutoWidth(5), __kWidth/3, AutoWidth(20))];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = MFont(AutoWidth(15));
        _titleLabel.textColor = __TextColor;
    }
    return _titleLabel;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

- (void)setImageName:(NSString *)imageName{

}


@end
