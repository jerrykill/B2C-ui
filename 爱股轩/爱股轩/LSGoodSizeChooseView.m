//
//  LSGoodSizeChooseView.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodSizeChooseView.h"

@interface LSGoodSizeChooseView ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *detailLabel;

@property (strong,nonatomic) UIImageView *goinIV;

@end

@implementation LSGoodSizeChooseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.goinIV];
}

#pragma mark ==懒加载==
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(20), AutoWidth(35), AutoWidth(15))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = __LightTextColor;
        _titleLabel.font = MFont(AutoWidth(12));
        _titleLabel.text = @"已选";
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_titleLabel)+AutoWidth(15), AutoWidth(19), AutoWidth(280), AutoWidth(16))];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.textColor = __DTextColor;
        _detailLabel.font = MFont(AutoWidth(15));
        _detailLabel.userInteractionEnabled =YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseType)];
        [_detailLabel addGestureRecognizer:tap];
    }
    return _detailLabel;
}

- (UIImageView *)goinIV {
    if (!_goinIV) {
        _goinIV = [[UIImageView alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(24), AutoWidth(22), AutoWidth(7), AutoWidth(12))];
        _goinIV.contentMode = UIViewContentModeScaleAspectFill;
        _goinIV.image = MImage(@"goin_icon");
    }
    return _goinIV;
}

- (void)chooseType{
    [self.delegate chooseGoodType];
}

- (void)setDetail:(NSString *)detail {
    _detailLabel.text = detail;
}

@end
