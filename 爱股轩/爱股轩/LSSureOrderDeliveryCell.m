//
//  LSSureOrderDeliveryCell.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSSureOrderDeliveryCell.h"

@interface LSSureOrderDeliveryCell ()

@property (strong,nonatomic) UIImageView *headLineIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *detailLabel;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSSureOrderDeliveryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.headLineIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.lineIV];
}

#pragma mark ==懒加载==
- (UIImageView *)headLineIV {
    if (!_headLineIV) {
        _headLineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(5))];
        _headLineIV.backgroundColor =__BackColor;
    }
    return _headLineIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_headLineIV)+AutoWidth(19), AutoWidth(80), AutoWidth(15))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = __TextColor;
        _titleLabel.font = MFont(AutoWidth(14));
        _titleLabel.text = @"配送方式";
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(110), CGRectYH(_headLineIV)+AutoWidth(19), AutoWidth(100), AutoWidth(15))];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.textColor = __LightTextColor;
        _detailLabel.font = MFont(AutoWidth(13));
        _detailLabel.text = @"顺丰包邮";
    }
    return _detailLabel;
}

- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(59), __kWidth-AutoWidth(20), AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (void)setType:(NSString *)type {
    _detailLabel.text = type;
}



@end
