//
//  LSGoodDetailLikeCell.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailLikeCell.h"

@interface LSGoodDetailLikeCell ()

@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *priceLabel;

@end

@implementation LSGoodDetailLikeCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.goodIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];
}

#pragma mark ==懒加载==
- (UIImageView *)goodIV {
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(10), AutoWidth(111.5), AutoWidth(111.5))];
        _goodIV.backgroundColor = LH_RandomColor;
        _goodIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _goodIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_goodIV)+AutoWidth(5), AutoWidth(110), AutoWidth(30))];
        _titleLabel.font = MFont(AutoWidth(11));
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;

    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(4), AutoWidth(110), AutoWidth(15))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = LH_RGBCOLOR(224, 40, 40);
    }
    return _priceLabel;
}

- (void)setModel:(LSGoodDetailModel *)model {
    _model = model;
//    [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_model.goodUrl]]];
    _titleLabel.text = _model.goodTitle;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",_model.goodMoney]];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(10)) range:NSMakeRange(0, 1)];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(13)) range:NSMakeRange(1, attr.length-1)];
    _priceLabel.attributedText = attr;
}


@end
