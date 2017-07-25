//
//  LSTeacherRecommendHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherRecommendHeadView.h"

@interface LSTeacherRecommendHeadView ()

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UILabel *logoLabel;

@property (strong,nonatomic) UILabel *nameLabel;

@property (strong,nonatomic) UILabel *introduceLabel;

@property (strong,nonatomic) UIImageView *levelIV;

@end

@implementation LSTeacherRecommendHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.headIV];
    [self addSubview:self.logoLabel];
    [self addSubview:self.nameLabel];
    [self addSubview:self.introduceLabel];
    [self addSubview:self.levelIV];
    
}

#pragma mark ==懒加载==
- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(15), AutoWidth(10), AutoWidth(80), AutoWidth(80))];
        _headIV.layer.cornerRadius = AutoWidth(40);
        _headIV.backgroundColor = LH_RandomColor;
    }
    return _headIV;
}

- (UILabel *)logoLabel{
    if (!_logoLabel) {
        _logoLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_headIV)+AutoWidth(18), AutoWidth(15), AutoWidth(100), AutoWidth(15))];
        _logoLabel.textColor = __LightTextColor;
        _logoLabel.textAlignment = NSTextAlignmentLeft;
        _logoLabel.font = MFont(AutoWidth(12));
    }
    return _logoLabel;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_headIV)+AutoWidth(18), CGRectYH(_logoLabel), AutoWidth(100), AutoWidth(20))];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = MFont(AutoWidth(16));
        _nameLabel.textColor = __DTextColor;
    }
    return _nameLabel;
}

- (UILabel *)introduceLabel{
    if (!_introduceLabel) {
        _introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_headIV)+AutoWidth(18), CGRectYH(_nameLabel)+AutoWidth(10), AutoWidth(200), AutoWidth(32))];
        _introduceLabel.textAlignment = NSTextAlignmentLeft;
        _introduceLabel.numberOfLines = 2;
        _introduceLabel.font = MFont(AutoWidth(15));
        _introduceLabel.textColor = __TextColor;
    }
    return _introduceLabel;
}

- (UIImageView *)levelIV{
    if (!_levelIV) {
        _levelIV = [[UIImageView alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(45), AutoWidth(29), AutoWidth(30), AutoWidth(44))];
        _levelIV.contentMode = UIViewContentModeScaleToFill;
        _levelIV.image = MImage(@"level_ico1");
    }
    return _levelIV;
}

- (void)setModel:(LSTeacherModel *)model {
    _model =  model;
//    [_headIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_model.teacherUrl]]];
    _logoLabel.text = model.logoName;
    _nameLabel.text = model.teacherName;
    _introduceLabel.text = model.introduceInfo;
}


@end
