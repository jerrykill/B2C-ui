//
//  LSGoodEvalueCell.m
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodEvalueCell.h"
#import "LSGoodDetailEvalueHeadView.h"

@interface LSGoodEvalueCell ()

@property (strong,nonatomic) LSGoodDetailEvalueHeadView *headV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *buyTimeLabel;

@property (strong,nonatomic) UIImageView *bottomIV;

@end

@implementation LSGoodEvalueCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}


- (void)initView{
    [self addSubview:self.headV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.buyTimeLabel];
}

#pragma mark ==懒加载==
- (LSGoodDetailEvalueHeadView *)headV {
    if (!_headV) {
        _headV = [[LSGoodDetailEvalueHeadView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(35))];
        
    }
    return _headV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_headV), __kWidth-AutoWidth(20), AutoWidth(15))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = MFont(AutoWidth(12));
        _titleLabel.textColor = __DTextColor;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)buyTimeLabel {
    if (!_buyTimeLabel) {
        _buyTimeLabel = [[UILabel alloc]init];
        _buyTimeLabel.font = MFont(AutoWidth(10));
        _buyTimeLabel.textAlignment = NSTextAlignmentLeft;
        _buyTimeLabel.textColor = __LightTextColor;
    }
    return _buyTimeLabel;
}

- (UIImageView *)bottomIV {
    if (!_bottomIV) {
        _bottomIV = [[UIImageView alloc]init];
        _bottomIV.backgroundColor = __BackColor;
    }
    return _bottomIV;
}

- (void)setModel:(LSGoodDetailAppraiseModel *)model {
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            [obj removeFromSuperview];
        }
    }
    _model = model;
    NSString *text = _model.evalueInfo;
    CGSize size = [text boundingRectWithSize:CGSizeMake(__kWidth-AutoWidth(20), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:MFont(AutoWidth(12))} context:nil].size;
    _titleLabel.text = text;
    _titleLabel.frame = CGRectMake(AutoWidth(10), CGRectYH(_headV), __kWidth-AutoWidth(20), size.height);
    for (int i=0; i<_model.imageArr.count; i++) {
        if (i<3) {
            UIImageView *picIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10)+AutoWidth(60)*i, CGRectYH(_titleLabel)+AutoWidth(10), AutoWidth(50), AutoWidth(50))];
            [self addSubview:picIV];
//            [picIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_model.imageArr[i]]]];
            picIV.backgroundColor = LH_RandomColor;
        }
    }
    NSInteger t=_model.imageArr.count>0?1:0;
    _buyTimeLabel.frame = CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(10)+t*AutoWidth(70), __kWidth-AutoWidth(20), AutoWidth(15));
    _buyTimeLabel.text = [NSString stringWithFormat:@"购买日期：%@",_model.buyTime];

    self.bottomIV.frame = CGRectMake(0, CGRectYH(_buyTimeLabel)+AutoWidth(20), __kWidth, AutoWidth(5));
    [self addSubview:self.bottomIV];

}


@end
