//
//  LSGoodDetailSizeCell.m
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailSizeCell.h"

@interface LSGoodDetailSizeCell ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) NSMutableArray *buttonList;

@end

@implementation LSGoodDetailSizeCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _buttonList = [NSMutableArray array];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.lineIV];
    [self addSubview:self.titleLabel];
}

#pragma mark ==懒加载==
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(24), AutoWidth(10), AutoWidth(75), AutoWidth(20))];
        _titleLabel.font = MFont(AutoWidth(16));
        _titleLabel.textColor = __TextColor;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"选择";
    }
    return _titleLabel;
}

- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(20), 0, __kWidth-AutoWidth(40), 1)];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (void)setBtnArr:(NSArray *)btnArr {
    [_buttonList removeAllObjects];
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            [obj removeFromSuperview];
        }
    }
    _btnArr = btnArr;
    CGFloat width = AutoWidth(25);
    CGFloat height = AutoWidth(38);
    for (int i=0; i<_btnArr.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.layer.cornerRadius =AutoWidth(4);
        btn.layer.borderWidth = AutoWidth(1);
        btn.layer.borderColor = __BackColor.CGColor;
        btn.titleLabel.font = MFont(AutoWidth(15));
        [btn setTitle:_btnArr[i] forState:BtnNormal];
        [btn setTitleColor:__DTextColor forState:BtnNormal];
        [btn setTitle:_btnArr[i] forState:BtnStateSelected];
        [btn setTitleColor:__DefaultColor forState:BtnStateSelected];
        NSString *str = _btnArr[i];
        CGFloat length = [self convertToInt:str]+2;
        btn.frame = CGRectMake(width, height, length*AutoWidth(15), AutoWidth(40));
        if (length*AutoWidth(15)+width>__kWidth-AutoWidth(50)) {
            height +=AutoWidth(50);
            width=AutoWidth(25);
        }else{
            width +=length*AutoWidth(15)+AutoWidth(15);
        }

        btn.tag = i;
        [self addSubview:btn];
        [btn addTarget:self action:@selector(chooseType:) forControlEvents:BtnTouchUpInside];
        [_buttonList addObject:btn];
    }
}
#pragma mark ==计算字符串长度==
-  (NSInteger)convertToInt:(NSString*)strtemp {
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;

}

- (void)chooseType:(UIButton*)sender{
    for (UIButton* btn in _buttonList) {
        if (btn.tag == sender.tag) {
            btn.selected = YES;
        }else{
            btn.selected =NO;
        }
    }
    [self.delegate chooseGoodSize:sender.tag];
}


@end
