//
//  LSTeacherCollectionViewCell.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherCollectionViewCell.h"

@interface LSTeacherCollectionViewCell ()

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UILabel *nameLabel;

@end

@implementation LSTeacherCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.headIV];
    [self addSubview:self.nameLabel];
}

#pragma mark ==懒加载==
- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake((__kWidth/5-AutoWidth(58))/2, AutoWidth(10), AutoWidth(58), AutoWidth(58))];
        _headIV.layer.cornerRadius=AutoWidth(29);
        _headIV.backgroundColor = LH_RandomColor;
    }
    return _headIV;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectYH(_headIV)+AutoWidth(5), __kWidth/5, AutoWidth(20))];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = MFont(AutoWidth(15));
        _nameLabel.textColor = __DTextColor;
    }
    return _nameLabel;
}

- (void)setTitle:(NSString *)title{
    _nameLabel.text = title;
}

@end
