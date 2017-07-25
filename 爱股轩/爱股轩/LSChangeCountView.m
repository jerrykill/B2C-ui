//
//  LSChangeCountView.m
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSChangeCountView.h"

@interface LSChangeCountView ()
{
    CGFloat _width;
    CGFloat _height;
    NSInteger _num;
}

@property (strong,nonatomic) UIButton *addButton;

@property (strong,nonatomic) UIButton *reduceButton;

@property (strong,nonatomic) UIButton *countButton;

@property (strong,nonatomic) UIImageView *leftIV;

@property (strong,nonatomic) UIImageView *rightIV;

@end

@implementation LSChangeCountView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _width = frame.size.width;
        _height = frame.size.height;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.reduceButton];
    [self addSubview:self.leftIV];
    [self addSubview:self.countButton];
    [self addSubview:self.rightIV];
    [self addSubview:self.addButton];
}

#pragma mark ==懒加载==
- (UIButton *)reduceButton{
    if (!_reduceButton) {
        _reduceButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, _width*7/24, _height)];
        _reduceButton.tag = 20;
        [_reduceButton setImage:MImage(@"less") forState:BtnNormal];
        [_reduceButton addTarget:self action:@selector(modify:) forControlEvents:BtnTouchUpInside];
    }
    return _reduceButton;
}

- (UIImageView *)leftIV {
    if (!_leftIV) {
        _leftIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectYH(_reduceButton), 0, AutoWidth(1), _height)];
        _leftIV.backgroundColor = __BackColor;
    }
    return _leftIV;
}

- (UIButton *)countButton{
    if (!_countButton) {
        _countButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_reduceButton), 0, _width*5/12, _height)];
        _countButton.titleLabel.font = MFont(AutoWidth(15));
        [_countButton setTitleColor:__TextColor forState:BtnNormal];
        [_countButton setTitle:@"1" forState:BtnNormal];
        _num = 1;
        _countButton.userInteractionEnabled = NO;
    }
    return _countButton;
}

- (UIImageView *)rightIV {
    if (!_rightIV) {
        _rightIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_countButton)-AutoWidth(1), 0, AutoWidth(1), _height)];
        _rightIV.backgroundColor = __BackColor;
    }
    return _rightIV;
}

- (UIButton *)addButton{
    if (!_addButton) {
        _addButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_countButton), 0, _width*7/24, _height)];
        _addButton.tag = 21;
        [_addButton setImage:MImage(@"add") forState:BtnNormal];
        [_addButton addTarget:self action:@selector(modify:) forControlEvents:BtnTouchUpInside];
    }
    return _addButton;
}

- (void)modify:(UIButton*)sender{
    if (sender.tag-20) {
        [self.delegate changeCount:YES];
        _num++;
    }else{
        if (_num>1) {
            [self.delegate changeCount:NO];
            _num--;
        }
    }
    [_countButton setTitle:[NSString stringWithFormat:@"%ld",(long)_num] forState:BtnNormal];
}

- (void)setCount:(NSString *)count{
    _num = [count integerValue];
}

@end
