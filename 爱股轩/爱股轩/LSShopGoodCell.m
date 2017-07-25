//
//  LSShopGoodCell.m
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopGoodCell.h"

@interface LSShopGoodCell ()

@property (strong,nonatomic) UIButton *chooseButton;

@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *priceLabel;

@property (strong,nonatomic) UILabel *countLabel;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSShopGoodCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.chooseButton];
    [self addSubview:self.goodIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.countLabel];
    [self addSubview:self.lineIV];
}

#pragma mark ==懒加载==
- (UIButton *)chooseButton{
    if (!_chooseButton) {
        _chooseButton= [[UIButton alloc]initWithFrame:CGRectMake(0, AutoWidth(5), AutoWidth(40), AutoWidth(80))];
        [_chooseButton setImage:MImage(@"off") forState:BtnNormal];
        [_chooseButton setImage:MImage(@"on") forState:BtnStateSelected];
        _chooseButton.imageEdgeInsets = UIEdgeInsetsMake(0, AutoWidth(5), 0, 0);
        _chooseButton.layer.cornerRadius = 10;
        [_chooseButton addTarget:self action:@selector(choose:) forControlEvents:BtnTouchUpInside];
    }
    return _chooseButton;
}

- (UIImageView *)goodIV{
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_chooseButton), AutoWidth(12), AutoWidth(77), AutoWidth(77))];
        _goodIV.backgroundColor = LH_RandomColor;
        _goodIV.layer.borderWidth = 0.5;
        _goodIV.layer.borderColor = __BackColor.CGColor;
    }
    return _goodIV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(9), AutoWidth(15), AutoWidth(230), AutoWidth(32))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = MFont(AutoWidth(12));
        _titleLabel.textColor = __DTextColor;
        _titleLabel.text = @"张清华《一堂课拿掉你的人性操作弱点》光盘+教程";
    }
    return _titleLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(9), CGRectYH(_titleLabel)+AutoWidth(15), AutoWidth(150), AutoWidth(20))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = LH_RGBCOLOR(220, 31, 0);
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",@"535.00"]];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(12)) range:NSMakeRange(0, 1)];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(15)) range:NSMakeRange(1, 3)];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(12)) range:NSMakeRange(4, 3)];
        _priceLabel.attributedText = attr;
    }
    return _priceLabel;
}

- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(65), AutoWidth(75), AutoWidth(50), AutoWidth(16))];
        _countLabel.textAlignment = NSTextAlignmentRight;
        _countLabel.textColor = __DTextColor;
        _countLabel.font = MFont(AutoWidth(14));
        _countLabel.text = @"x1";
    }
    return _countLabel;
}

- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(99), __kWidth-AutoWidth(20), AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}


- (void)choose:(UIButton*)sender{
    sender.selected = !sender.selected;
    [self.delegate choose:sender.selected index:self.tag];
}

#pragma mark ==赋值==
- (void)setModel:(LSShopGoodModel *)model{
    _model = model;
    [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_model.goodUrl]]];
    _titleLabel.text = _model.goodtitle;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",_model.price]];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(12)) range:NSMakeRange(0, 1)];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(15)) range:NSMakeRange(1, _model.price.length-3)];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(12)) range:NSMakeRange(_model.price.length-2, 3)];
    _priceLabel.attributedText = attr;

    _countLabel.text = [NSString stringWithFormat:@"x%@",_model.goodNum];

    _chooseButton.selected = _model.isChoose;
}


@end
