//
//  LSGoodDetailBottomFreshView.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailBottomFreshView.h"
#import "LSGoodDetailTypeChooseView.h"

@interface LSGoodDetailBottomFreshView ()

@property (strong,nonatomic) UIImageView *arrowIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) LSGoodDetailTypeChooseView *typeV;

@end

@implementation LSGoodDetailBottomFreshView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.arrowIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.typeV];
}

#pragma mark ==懒加载==
- (UIImageView *)arrowIV {
    if (!_arrowIV) {
        _arrowIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(95), AutoWidth(16), AutoWidth(11), AutoWidth(11))];
        _arrowIV.image = MImage(@"arrow_icon");
        _arrowIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _arrowIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_arrowIV)+AutoWidth(5), AutoWidth(14), AutoWidth(170), AutoWidth(15))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = __LightTextColor;
        _titleLabel.font = MFont(AutoWidth(13));
        _titleLabel.text = @"继续滑动查看更多商品信息";
    }
    return _titleLabel;
}

- (LSGoodDetailTypeChooseView *)typeV {
    if (!_typeV) {
        _typeV = [[LSGoodDetailTypeChooseView alloc]initWithFrame:CGRectMake(0, AutoWidth(42), __kWidth, AutoWidth(38))];
        _typeV.userInteractionEnabled = NO;

    }
    return _typeV;
}

- (void)setSelectType:(NSString *)selectType {
    _typeV.selectType = [selectType integerValue];
}


@end
