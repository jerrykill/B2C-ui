//
//  LSAnnounceCell.m
//  爱股轩
//
//  Created by imac on 2017/4/14.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSAnnounceCell.h"

@interface LSAnnounceCell ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSAnnounceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headIV];
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineIV];
    }
    return self;
}

- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(28), AutoWidth(28))];
        _headIV.layer.cornerRadius = 4;
        _headIV.image = MImage(@"announcement");
    }
    return _headIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_headIV)+AutoWidth(10), AutoWidth(15), AutoWidth(300), AutoWidth(20))];
        _titleLabel.font = MFont(AutoWidth(16));
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(57), AutoWidth(355), AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}


@end
