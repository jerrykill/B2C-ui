//
//  LSClassFirstCell.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSClassFirstCell.h"

@interface LSClassFirstCell ()

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) UILabel *titleLb;



@end

@implementation LSClassFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.logoIV];
    [self addSubview:self.titleLb];
    [self addSubview:self.lineIV];
    [self bringSubviewToFront:_lineIV];
}

#pragma mark ==懒加载==
- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(29), AutoWidth(18), AutoWidth(32), AutoWidth(30))];
        _logoIV.backgroundColor = LH_RandomColor;
    }
    return _logoIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectYH(_logoIV)+AutoWidth(4), AutoWidth(90), AutoWidth(16))];
        _titleLb.font = MFont(AutoWidth(14));
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = __DTextColor;
    }
    return _titleLb;
}

- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(2), AutoWidth(90))];
        _lineIV.backgroundColor = [UIColor whiteColor];
    }
    return _lineIV;
}

- (void)setTitle:(NSString *)title{
    _titleLb.text = title;
}

- (void)setImageName:(NSString *)imageName{
    _logoIV.image = MImage(imageName);
}


@end
