//
//  LSSureOrderAddressCell.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSSureOrderAddressCell.h"

@interface LSSureOrderAddressCell ()

@property (strong,nonatomic) UIImageView *userIV;

@property (strong,nonatomic) UILabel *nameLb;

@property (strong,nonatomic) UIImageView *phoneIV;

@property (strong,nonatomic) UILabel *phoneLb;

@property (strong,nonatomic) UILabel *addressLb;

@property (strong,nonatomic) UIImageView *jinIV;

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) UIImageView *bottomIV;

@end

@implementation LSSureOrderAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor =[UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.userIV];
    [self addSubview:self.nameLb];
    [self addSubview:self.phoneIV];
    [self addSubview:self.phoneLb];
    [self addSubview:self.addressLb];
    [self addSubview:self.lineIV];
    [self addSubview:self.bottomIV];
}

#pragma mark ==懒加载==
- (UIImageView *)userIV {
    if (!_userIV) {
        _userIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(9), AutoWidth(13), AutoWidth(15), AutoWidth(22))];
        _userIV.image = MImage(@"people_icon");
        _userIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _userIV;
}

- (UILabel *)nameLb {
    if (!_nameLb) {
        _nameLb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_userIV)+AutoWidth(7), AutoWidth(14), AutoWidth(180), AutoWidth(20))];
        _nameLb.textAlignment = NSTextAlignmentLeft;
        _nameLb.textColor = __DTextColor;
        _nameLb.font = MFont(AutoWidth(16));

    }
    return _nameLb;
}

- (UIImageView *)phoneIV {
    if (!_phoneIV) {
        _phoneIV = [[UIImageView alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(160), AutoWidth(16), AutoWidth(13), AutoWidth(17))];
        _phoneIV.contentMode = UIViewContentModeScaleAspectFill;
        _phoneIV.image = MImage(@"iPhone_icon");
    }
    return _phoneIV;
}

- (UILabel *)addressLb {
    if (!_addressLb) {
        _addressLb = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(9), CGRectYH(_nameLb)+AutoWidth(14), __kWidth-AutoWidth(60), 15)];
        _addressLb.textAlignment = NSTextAlignmentLeft;
        _addressLb.textColor = LH_RGBCOLOR(153, 153, 153);
        _addressLb.font = MFont(AutoWidth(14));
    }
    return _addressLb;
}
- (UIImageView *)jinIV {
    if (!_jinIV) {
        _jinIV = [[UIImageView alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(20), AutoWidth(43), AutoWidth(9), AutoWidth(16))];
        _jinIV.contentMode = UIViewContentModeScaleAspectFill;
        _jinIV.image = MImage(@"arrow");
    }
    return _jinIV;
}

- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoWidth(80), __kWidth, AutoWidth(4))];
        _lineIV.image = MImage(@"address_line");
        _lineIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _lineIV;
}

- (UIImageView *)bottomIV {
    if (!_bottomIV) {
        _bottomIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectYH(_lineIV)+AutoWidth(1), __kWidth, AutoWidth(5))];
        _bottomIV.backgroundColor= __BackColor;
    }
    return _bottomIV;
}

- (void)setModel:(YAddressModel *)model {
    _model = model;
    _nameLb.text = _model.name;
    _phoneLb.text = _model.phone;
    _addressLb.text = [NSString stringWithFormat:@"%@%@%@%@",_model.province,_model.city,_model.area,_model.Address];
}


@end
