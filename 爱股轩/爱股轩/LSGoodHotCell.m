//
//  LSGoodHotCell.m
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodHotCell.h"

@interface LSGoodHotCell ()
{
    CGRect _frame;
}
@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *priceLabel;

@end

@implementation LSGoodHotCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        _frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.goodIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];

}

#pragma mark ==懒加载==
- (UIImageView *)goodIV{
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, AutoWidth(187))];
        _goodIV.backgroundColor = LH_RandomColor;
    }
    return _goodIV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_goodIV)+AutoWidth(5), _frame.size.width-AutoWidth(20), AutoWidth(20))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = MFont(AutoWidth(15));
        _titleLabel.textColor = __DTextColor;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(5), _frame.size.width-AutoWidth(20), AutoWidth(20))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = __MoneyColor;
    }
    return _priceLabel;
}

- (void)setModel:(YGoodsModel *)model{
    _model = model;
//    [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_dataModel.goodUrl]]];
    _titleLabel.text = _model.goodTitle;
    NSMutableAttributedString *price = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",_model.goodMoney]];
    [price setAttributes:@{NSFontAttributeName:MFont(AutoWidth(10))} range:NSMakeRange(0, 1)];
    [price setAttributes:@{NSFontAttributeName:MFont(AutoWidth(15))} range:NSMakeRange(1, (price.length-3))];
    [price setAttributes:@{NSFontAttributeName:MFont(AutoWidth(10))} range:NSMakeRange((price.length-2), 2)];
    _priceLabel.attributedText = price;


}




@end
