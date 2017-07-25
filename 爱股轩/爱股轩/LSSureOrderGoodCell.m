//
//  LSSureOrderGoodCell.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSSureOrderGoodCell.h"

@interface LSSureOrderGoodCell ()

@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *priceLabel;

@property (strong,nonatomic) UILabel *numLabel;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSSureOrderGoodCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.goodIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.numLabel];
    [self addSubview:self.lineIV];
}

#pragma mark ==懒加载==
- (UIImageView *)goodIV {
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(14), AutoWidth(82), AutoWidth(82))];
        _goodIV.backgroundColor =LH_RandomColor;
        _goodIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _goodIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(15), AutoWidth(17), AutoWidth(240), AutoWidth(38))];
        _titleLabel.textColor = __TextColor;
        _titleLabel.font = MFont(AutoWidth(14));
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(15), CGRectYH(_titleLabel)+AutoWidth(17), AutoWidth(120), AutoWidth(15))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = LH_RGBCOLOR(240, 35, 0);
    }
    return _priceLabel;
}

- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(70), CGRectYH(_priceLabel)+AutoWidth(16), AutoWidth(60), AutoWidth(15))];
        _numLabel.textColor = __DTextColor;
        _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.font = MFont(AutoWidth(14));
    }
    return _numLabel;
}

- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoWidth(109), __kWidth, AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (void)setModel:(LSGoodModel *)model {
    _model = model;
//    [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_model.goodUrl]]];
    NSMutableAttributedString *attr =[[NSMutableAttributedString alloc]initWithString:_model.goodName];
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc]init];
    [para setLineSpacing:AutoWidth(7)];
    [attr addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, attr.length)];
    _titleLabel.attributedText = attr;

    NSMutableAttributedString *money = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",_model.goodPrice]];
    [money addAttribute:NSFontAttributeName value:MFont(AutoWidth(12)) range:NSMakeRange(0, 1)];
    [money addAttribute:NSFontAttributeName value:MFont(AutoWidth(14)) range:NSMakeRange(1, money.length-1)];
    _priceLabel.attributedText = money;

    _numLabel.text = [NSString stringWithFormat:@"×%@",_model.num];

}

@end
