//
//  LSGroupPopularityCell.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGroupPopularityCell.h"

@interface LSGroupPopularityCell ()

@property (strong,nonatomic) UIImageView *rankIV;//排序

@property (strong,nonatomic) UIImageView *goodIV;//商品图

@property (strong,nonatomic) UILabel *titleLabel;//商品标题

@property (strong,nonatomic) UILabel *oldPriceLabel;//原价

@property (strong,nonatomic) UILabel *priceLabel;//现价

@property (strong,nonatomic) UIImageView *tagBackIV;//背景图

@property (strong,nonatomic) UIButton *buyButton;//立即购买

@property (strong,nonatomic) UILabel *timeLabel;//活动倒计时

//@property (strong,nonatomic) NSTimer *timer;

//@property (assign,nonatomic) NSInteger activeTimes;

@end

@implementation LSGroupPopularityCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.rankIV];
    [self bringSubviewToFront:_rankIV];
    [self addSubview:self.goodIV];
    [self sendSubviewToBack:_goodIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.oldPriceLabel];
    [self addSubview:self.tagBackIV];
    [self sendSubviewToBack:_tagBackIV];
    [self addSubview:self.priceLabel];
    [self addSubview:self.buyButton];
    [self addSubview:self.timeLabel];

}

#pragma mark ==懒加载==
- (UIImageView *)rankIV{
    if (!_rankIV) {
        _rankIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(9), AutoWidth(20), AutoWidth(21))];

    }
    return _rankIV;
}

- (UIImageView *)goodIV {
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(20), AutoWidth(146), AutoWidth(146))];
        _goodIV.contentMode = UIViewContentModeScaleAspectFill;
        _goodIV.layer.cornerRadius = 5;
        _goodIV.backgroundColor = LH_RandomColor;
    }
    return _goodIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(30), AutoWidth(20), AutoWidth(170), AutoWidth(55))];
        _titleLabel.numberOfLines = 3;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = __DTextColor;
        _titleLabel.font = MFont(AutoWidth(14));
    }
    return _titleLabel;
}

- (UILabel *)oldPriceLabel {
    if (!_oldPriceLabel) {
        _oldPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(30), CGRectYH(_titleLabel)+AutoWidth(5), AutoWidth(170), AutoWidth(15))];
        _oldPriceLabel.textAlignment = NSTextAlignmentRight;
        _oldPriceLabel.textColor = __LightTextColor;
        _oldPriceLabel.font = MFont(AutoWidth(13));
    }
    return _oldPriceLabel;
}

- (UIImageView *)tagBackIV {
    if (!_tagBackIV) {
        _tagBackIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(30), CGRectYH(_oldPriceLabel)+AutoWidth(10), AutoWidth(167), AutoWidth(39))];
        _tagBackIV.contentMode = UIViewContentModeScaleAspectFill;
        _tagBackIV.image = MImage(@"buy_bg");

    }
    return _tagBackIV;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectX(_tagBackIV)+AutoWidth(5),CGRectY(_tagBackIV)+AutoWidth(11), AutoWidth(80), AutoWidth(17))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.font = MFont(AutoWidth(15));

    }
    return _priceLabel;
}

- (UIButton *)buyButton {
    if (!_buyButton) {
        _buyButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_priceLabel),CGRectY(_tagBackIV)+AutoWidth(6), AutoWidth(67), AutoWidth(25))];
        _buyButton.backgroundColor = LH_RGBCOLOR(255, 241, 17);
        _buyButton.layer.cornerRadius = AutoWidth(3);
        _buyButton.titleLabel.font = MFont(AutoWidth(12));
        [_buyButton setTitle:@"立即购买" forState:BtnNormal];
        [_buyButton setTitleColor:LH_RGBCOLOR(191, 28, 70) forState:BtnNormal];
        [_buyButton addTarget:self action:@selector(chooseBuy) forControlEvents:BtnTouchUpInside];
    }
    return _buyButton;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectX(_titleLabel), CGRectYH(_tagBackIV)+AutoWidth(10), AutoWidth(170), AutoWidth(15))];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = __TextColor;
    }
    return _timeLabel;
}

- (void)setModel:(YGoodsModel *)model{
    _model = model;
    NSString *rankName = [NSString stringWithFormat:@"label_%ld",self.tag+1];
    _rankIV.image = MImage(rankName);
    _titleLabel.text = model.goodTitle;

//    if (!_activeTimes) {
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduce) userInfo:nil repeats:YES];
//        _activeTimes = [model.activeTime integerValue];

        NSString *hour = [NSString stringWithFormat:@"%02ld",[model.activeTime integerValue]/3600];
        NSString *minute = [NSString stringWithFormat:@"%02ld",[model.activeTime integerValue]%3600/60];
        NSString *second = [NSString stringWithFormat:@"%02ld",[model.activeTime integerValue]%3600%60];
        NSMutableAttributedString *times = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"距结束：%@:%@:%@",hour,minute,second]];
        [times addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(4, times.length-4)];
        _timeLabel.attributedText = times;
//    }

    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",model.goodOldMoney]];
    [attr addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, attr.length)];
    _oldPriceLabel.attributedText = attr;

    NSMutableAttributedString *price = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",model.activeMoney]];
    [price addAttribute:NSFontAttributeName value:MFont(AutoWidth(10)) range:NSMakeRange(0, 1)];
    _priceLabel.attributedText = price;


}



//- (void)reduce{
//    _activeTimes--;
//    NSString *hour = [NSString stringWithFormat:@"%02ld",_activeTimes/3600];
//    NSString *minute = [NSString stringWithFormat:@"%02ld",_activeTimes%3600/60];
//    NSString *second = [NSString stringWithFormat:@"%02ld",_activeTimes%3600%60];
//    NSMutableAttributedString *times = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"距结束：%@:%@:%@",hour,minute,second]];
//    [times addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(4, times.length-4)];
//    _timeLabel.attributedText = times;
//}

//- (void)dealloc{
//    //取消定时器
//    [_timer invalidate];
//    _timer = nil;
//
//}

#pragma mark ==立即购买==
- (void)chooseBuy{
    [self.delegate chooseBuy:self.tag];
}


@end
