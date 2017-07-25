//
//  LSGoodsDetailTitleCell.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodsDetailTitleCell.h"

@interface LSGoodsDetailTitleCell ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UIButton *shareButton;

@property (strong,nonatomic) UILabel *timeLabel;

@property (strong,nonatomic) UILabel *priceLabel;

@property (strong,nonatomic) UILabel *oldPriceLabel;


@end

@implementation LSGoodsDetailTitleCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.titleLabel];
    [self addSubview:self.shareButton];
    [self addSubview:self.timeLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.oldPriceLabel];
}

#pragma mark ==懒加载==
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(310), AutoWidth(44))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        _titleLabel.textColor = __DTextColor;
        _titleLabel.font = MFont(AutoWidth(18));
    }
    return _titleLabel;
}

- (UIButton *)shareButton {
    if (!_shareButton) {
        _shareButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_titleLabel)+AutoWidth(10), AutoWidth(12), AutoWidth(40), AutoWidth(44))];
        [_shareButton setImage:MImage(@"share") forState:BtnNormal];
        [_shareButton setTitle:@"分享" forState:BtnNormal];
        [_shareButton setTitleColor:LH_RGBCOLOR(117, 117, 117) forState:BtnNormal];
        _shareButton.titleLabel.font = MFont(AutoWidth(12));
        _shareButton.imageEdgeInsets = UIEdgeInsetsMake(AutoWidth(4), AutoWidth(13), AutoWidth(20), 0);
        _shareButton.titleEdgeInsets = UIEdgeInsetsMake(AutoWidth(25), -AutoWidth(16), 0, 0);
        [_shareButton addTarget:self action:@selector(shareAction) forControlEvents:BtnTouchUpInside];
    }
    return _shareButton;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(12), __kWidth-AutoWidth(60), AutoWidth(15))];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = LH_RGBCOLOR(224, 40, 40);
        _timeLabel.font = MFont(AutoWidth(13));
        _timeLabel.hidden = YES;
    }
    return _timeLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = LH_RGBCOLOR(224, 40, 40);
    }
    return _priceLabel;
}

- (UILabel *)oldPriceLabel {
    if (!_oldPriceLabel) {
        _oldPriceLabel = [[UILabel alloc]init];
        _oldPriceLabel.textAlignment = NSTextAlignmentLeft;
        _oldPriceLabel.textColor = LH_RGBCOLOR(117, 117, 117);
        _oldPriceLabel.font = MFont(AutoWidth(13));
    }
    return _oldPriceLabel;
}

- (void)setModel:(LSGoodDetailModel *)model {
    _model = model;
    _titleLabel.text = _model.goodTitle;
    if (IsNilString(model.endTime)) {
        _priceLabel.frame = CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(14), AutoWidth(100), AutoWidth(20));
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",model.goodMoney]];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(15)) range:NSMakeRange(0, 1)];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(19)) range:NSMakeRange(1, attr.length-3)];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(16)) range:NSMakeRange(attr.length-3, 3)];
        _priceLabel.attributedText = attr;
    }else{
        _timeLabel.hidden = NO;
        [self getTimeDate];
        _priceLabel.frame = CGRectMake(AutoWidth(10), CGRectYH(_timeLabel)+AutoWidth(12), AutoWidth(100), AutoWidth(20));
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",model.activityMoney]];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(15)) range:NSMakeRange(0, 1)];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(19)) range:NSMakeRange(1, attr.length-3)];
        [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(16)) range:NSMakeRange(attr.length-3, 3)];
        _priceLabel.attributedText = attr;

        _oldPriceLabel.frame = CGRectMake(CGRectXW(_priceLabel), CGRectYH(_timeLabel)+AutoWidth(16), AutoWidth(100), AutoWidth(15));
        NSMutableAttributedString *attt = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"原价：¥%@",_model.goodMoney]];
        [attt addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(4, attt.length-4)];
        _oldPriceLabel.attributedText = attt;
    }
}

- (void)getTimeDate{
    NSDate *now = [NSDate date];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[_model.endTime integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *greorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
    NSDateComponents *dateCom = [greorian components:unit fromDate:now toDate:endDate options:0];

    _timeLabel.text = [NSString stringWithFormat:@"促销剩余时间:%02ld天%02ld小时%02ld分钟%02ld秒",(dateCom.day + dateCom.month*30+dateCom.year*365),dateCom.hour,dateCom.minute,dateCom.second];
}


#pragma mark ==分享==
- (void)shareAction{
    [self.delegate chooseShare];
}



@end
