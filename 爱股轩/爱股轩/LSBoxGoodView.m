//
//  LSBoxGoodView.m
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSBoxGoodView.h"

@interface LSBoxGoodView ()

@property (strong,nonatomic) UIView *backV;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *priceLabel;

@end

@implementation LSBoxGoodView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.backV];
    [_backV addSubview:self.goodIV];
    [_backV addSubview:self.titleLabel];
    [_backV addSubview:self.priceLabel];
    [_backV addSubview:self.logoIV];
    [_backV bringSubviewToFront:self.logoIV];
    
}

#pragma mark ==懒加载==
- (UIView *)backV{
    if (!_backV) {
        _backV = [[UIView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(0), AutoWidth(125), AutoWidth(170))];
        _backV.layer.borderColor = __BackColor.CGColor;
        _backV.layer.borderWidth = 1;
        _backV.backgroundColor = [UIColor whiteColor];
    }
    return _backV;
}

- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(33), AutoWidth(33))];
        _logoIV.backgroundColor = LH_RandomColor;
    }
    return _logoIV;
}

- (UIImageView *)goodIV{
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(125), AutoWidth(125))];
        _goodIV.backgroundColor = LH_RandomColor;
    }
    return _goodIV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_goodIV)+AutoWidth(3), AutoWidth(115), AutoWidth(20))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = MFont(AutoWidth(14));
        _titleLabel.textColor = __DTextColor;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(1), AutoWidth(115), AutoWidth(15))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;

    }
    return _priceLabel;
}

- (void)setModel:(YGoodsModel *)model{
    _model = model;
//    [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_model.goodUrl]]];
    _titleLabel.text = _model.goodTitle;
    NSMutableAttributedString *atrri = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@/¥%@",_model.goodMoney,_model.goodOldMoney]];
    [atrri addAttribute:NSForegroundColorAttributeName value:LH_RGBCOLOR(224, 40, 40) range:NSMakeRange(0, _model.goodMoney.length+1)];
    [atrri addAttribute:NSForegroundColorAttributeName value:LH_RGBCOLOR(168, 168, 168) range:NSMakeRange(_model.goodMoney.length+1, atrri.length-_model.goodMoney.length-1)];
    [atrri addAttribute:NSFontAttributeName value:MFont(AutoWidth(13)) range:NSMakeRange(1, _model.goodMoney.length-3)];
    [atrri addAttribute:NSFontAttributeName value:MFont(AutoWidth(10)) range:NSMakeRange(0, 1)];
    [atrri addAttribute:NSFontAttributeName value:MFont(AutoWidth(10)) range:NSMakeRange(_model.goodMoney.length-1, _model.goodOldMoney.length+4)];
    [atrri addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(_model.goodMoney.length+3, _model.goodOldMoney.length)];
    _priceLabel.attributedText = atrri;

}
- (void)setLogoName:(NSString *)logoName{
    _logoIV.image = MImage(logoName);
}

@end
