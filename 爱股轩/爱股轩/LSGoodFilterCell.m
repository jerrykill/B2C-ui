//
//  LSGoodFilterCell.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodFilterCell.h"

@interface LSGoodFilterCell ()
//图片
@property (strong,nonatomic) UIImageView *goodIV;
//标题
@property (strong,nonatomic) UILabel *titleLabel;
//价格
@property (strong,nonatomic) UILabel *priceLabel;
//评价
@property (strong,nonatomic) UILabel *appraiseLabel;
//交易成功
@property (strong,nonatomic) UILabel *successLabel;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSGoodFilterCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.goodIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.appraiseLabel];
    [self addSubview:self.successLabel];
    [self addSubview:self.lineIV];
}


#pragma mark ==懒加载==
- (UIImageView *)goodIV {
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(110), AutoWidth(110))];
        _goodIV.backgroundColor = LH_RandomColor;
        _goodIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _goodIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(10), AutoWidth(20), AutoWidth(216), AutoWidth(40))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        _titleLabel.textColor = __DTextColor;
        _titleLabel.font = MFont(AutoWidth(16));

    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(15), AutoWidth(216), AutoWidth(20))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = LH_RGBCOLOR(242, 35, 0);
    }
    return _priceLabel;
}

- (UILabel *)appraiseLabel {
    if (!_appraiseLabel) {
        _appraiseLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(10), CGRectYH(_priceLabel)+AutoWidth(7), AutoWidth(100), AutoWidth(15))];
        _appraiseLabel.font = MFont(AutoWidth(12));
        _appraiseLabel.textAlignment = NSTextAlignmentLeft;
        _appraiseLabel.textColor = __LightTextColor;
    }
    return _appraiseLabel;
}

- (UILabel *)successLabel {
    if (!_successLabel) {
        _successLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_appraiseLabel), CGRectYH(_priceLabel)+AutoWidth(7), AutoWidth(100), AutoWidth(15))];
        _successLabel.font = MFont(AutoWidth(12));
        _successLabel.textAlignment = NSTextAlignmentLeft;
        _successLabel.textColor = __LightTextColor;
    }
    return _successLabel;
}

- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(5), AutoWidth(130), AutoWidth(235), AutoWidth(2))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (void)setModel:(LSGoodModel *)model {
//    [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,model.goodUrl]]];
    _titleLabel.text = model.goodName;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",model.goodPrice]];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(12)) range:NSMakeRange(0, 1)];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(16)) range:NSMakeRange(1, attr.length-1)];
    _priceLabel.attributedText = attr;
    _appraiseLabel.text = [NSString stringWithFormat:@"已有%@条评论",model.evaluteCount];
    _successLabel.text = [NSString stringWithFormat:@"%@笔交易成功",model.dealCount];

}

@end
