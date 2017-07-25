//
//  LSSpecialHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSSpecialHeadView.h"
#import "LSClassChooseButton.h"

@interface LSSpecialHeadView ()

@property (strong,nonatomic) UILabel *titleLb;

@property (strong,nonatomic) NSMutableArray *buttonArr;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSSpecialHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =__BackColor;
        _buttonArr = [NSMutableArray array];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.titleLb];
}

#pragma mark ==懒加载==
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(260), AutoWidth(15))];
        _titleLb.backgroundColor = [UIColor clearColor];
        _titleLb.font = MFont(AutoWidth(14));
        _titleLb.textColor = __DTextColor;
    }
    return _titleLb;
}

- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, AutoWidth(38), AutoWidth(260), 1)];
        _lineIV.backgroundColor= LH_RGBCOLOR(237, 237, 237);
    }
    return _lineIV;
}

- (void)setTitleArr:(NSArray *)titleArr{
    _titleArr = titleArr;
    for (int i=0; i<_titleArr.count; i++) {
        LSClassChooseButton *btn = [[LSClassChooseButton alloc]initWithFrame:CGRectMake(AutoWidth(15)+AutoWidth(75)*i, 0, AutoWidth(60), AutoWidth(38))];
        [self addSubview:btn];
        btn.tag = i;
        [btn setTitle:_titleArr[i] forState:BtnNormal];
        [btn setTitleColor:__TextColor forState:BtnNormal];
        [btn setTitleColor:__DefaultColor forState:BtnStateSelected];
        btn.titleLabel.font = MFont(AutoWidth(14));
        if (!i) {
            btn.selected = YES;
            btn.lineIV.backgroundColor = __DefaultColor;
        }else{
            btn.selected = NO;
            btn.lineIV.backgroundColor = LH_RGBCOLOR(237, 237, 237);
        }
        [btn addTarget:self action:@selector(chooseClass:) forControlEvents:BtnTouchUpInside];
        [_buttonArr addObject:btn];
    }
    [self addSubview:self.lineIV];
    _titleLb.frame= CGRectMake(AutoWidth(10), CGRectYH(_lineIV)+AutoWidth(10), AutoWidth(260), AutoWidth(15));

}

- (void)chooseClass:(LSClassChooseButton*)sender{
    for (LSClassChooseButton *btn in _buttonArr) {
        if (btn.tag == sender.tag) {
            btn.selected=YES;
            btn.lineIV.backgroundColor = __DefaultColor;
        }else{
            btn.selected = NO;
            btn.lineIV.backgroundColor = LH_RGBCOLOR(237, 237, 237);
        }
    }
    [self.delegate chooseClassIndex:sender.tag];
}

- (void)setTestName:(NSString *)testName{
    _titleLb.text = testName;
}


@end
