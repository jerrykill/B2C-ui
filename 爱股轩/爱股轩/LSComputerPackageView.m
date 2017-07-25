//
//  LSComputerPackageView.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSComputerPackageView.h"

@interface LSComputerPackageView ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *detailLabel;

@property (strong,nonatomic) UIImageView *headIV;

@end

@implementation LSComputerPackageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.headIV];
}

#pragma mark ==懒加载==
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(10), AutoWidth(125), AutoWidth(20))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = BFont(AutoWidth(16));
        _titleLabel.textColor = LH_RGBCOLOR(255, 37, 0);
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(4), AutoWidth(120), AutoWidth(16))];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.font = MFont(AutoWidth(14));
        _detailLabel.textColor = LH_RGBCOLOR(111, 111, 111);
    }
    return _detailLabel;
}

- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_titleLabel)+AutoWidth(5), AutoWidth(10), AutoWidth(92), AutoWidth(60))];
        _headIV.backgroundColor = LH_RandomColor;
    }
    return _headIV;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

- (void)setDetail:(NSString *)detail{
    _detailLabel.text = detail;
}

- (void)setImageName:(NSString *)imageName{

}

@end
