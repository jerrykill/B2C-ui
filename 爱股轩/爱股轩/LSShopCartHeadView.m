//
//  LSShopCartHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopCartHeadView.h"

@interface LSShopCartHeadView ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UIButton *editButton;

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSShopCartHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headIV];
        [self addSubview:self.titleLabel];
        [self addSubview:self.editButton];
        [self addSubview:self.lineIV];
    }
    return self;
}


#pragma mark ==懒加载==
- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(10))];
        _headIV.backgroundColor = __BackColor;
    }
    return _headIV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((__kWidth-180)/2, AutoWidth(20), 180, AutoWidth(20))];
        _titleLabel.font = MFont(AutoWidth(17));
        _titleLabel.textColor = __DefaultColor;
        _titleLabel.text = @"爱股轩商城";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)editButton{
    if (!_editButton) {
        _editButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(60), AutoWidth(25), AutoWidth(50), AutoWidth(15))];
        _editButton.titleLabel.font = MFont(AutoWidth(13));
        [_editButton setTitle:@"编辑" forState:BtnNormal];
        [_editButton setTitle:@"完成" forState:BtnStateSelected];
        [_editButton setTitleColor:LH_RGBCOLOR(153, 153, 153) forState:BtnNormal];
        [_editButton setTitleColor:LH_RGBCOLOR(153, 153, 153) forState:BtnStateSelected];
        [_editButton setImage:MImage(@"Cart_edit") forState:BtnNormal];
        [_editButton setImage:MImage(@"Cart_edit") forState:BtnStateSelected];
        [_editButton addTarget:self action:@selector(editAction:) forControlEvents:BtnTouchUpInside];
        _editButton.titleEdgeInsets = UIEdgeInsetsMake(0, -AutoWidth(45), 0, 0);
        _editButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -AutoWidth(50));
    }
    return _editButton;
}


- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoWidth(54), __kWidth, AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}


- (void)editAction:(UIButton*)sender{
    sender.selected = !sender.selected;
    [self.delegate AllEdit:sender.selected];
}

@end
