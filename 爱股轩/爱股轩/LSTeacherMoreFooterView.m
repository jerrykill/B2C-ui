//
//  LSTeacherMoreFooterView.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherMoreFooterView.h"

@interface LSTeacherMoreFooterView ()

@property (strong,nonatomic) UIButton *titleBtn;

@property (strong,nonatomic) UIImageView *bottomIV;

@end

@implementation LSTeacherMoreFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.titleBtn];
    [self addSubview:self.bottomIV];
}

#pragma mark ==懒加载==
- (UIButton *)titleBtn{
    if (!_titleBtn) {
        _titleBtn = [[UIButton alloc]initWithFrame:CGRectMake((__kWidth-120)/2, AutoWidth(5), 120, AutoWidth(34))];
        [_titleBtn setTitle:@"查看更多名师" forState:BtnNormal];
        [_titleBtn setImage:MImage(@"more_icon_home_pressed") forState:BtnNormal];
        [_titleBtn setTitleColor:[UIColor lightGrayColor] forState:BtnNormal];
        _titleBtn.titleLabel.font = MFont(12);
        _titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, AutoWidth(20));
        _titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, AutoWidth(100), 0, 0);
        _titleBtn.layer.cornerRadius = AutoWidth(6);
        [_titleBtn addTarget:self action:@selector(makeMoreTeacher) forControlEvents:BtnTouchUpInside];
    }
    return _titleBtn;
}

- (UIImageView *)bottomIV{
    if (!_bottomIV) {
        _bottomIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoWidth(40), __kWidth, AutoWidth(10))];
        _bottomIV.backgroundColor =  __BackColor;
    }
    return _bottomIV;
}


- (void)makeMoreTeacher{
    [self.delegate lookMoreTeacher];
}


@end
