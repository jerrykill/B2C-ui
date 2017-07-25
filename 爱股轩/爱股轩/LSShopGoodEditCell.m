//
//  LSShopGoodEditCell.m
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopGoodEditCell.h"
#import "LSChangeCountView.h"

@interface LSShopGoodEditCell ()<LSChangeCountViewDelegate>

@property (strong,nonatomic) UIButton *chooseButton;

@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) LSChangeCountView *changeCountV;

@property (strong,nonatomic) UIButton *deleteButton;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSShopGoodEditCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.chooseButton];
    [self addSubview:self.goodIV];
    [self addSubview:self.changeCountV];
    [self addSubview:self.deleteButton];
    [self addSubview:self.lineIV];
}

#pragma mark ==懒加载==
- (UIButton *)chooseButton{
    if (!_chooseButton) {
        _chooseButton= [[UIButton alloc]initWithFrame:CGRectMake(0, AutoWidth(5), AutoWidth(40), AutoWidth(80))];
        [_chooseButton setImage:MImage(@"off") forState:BtnNormal];
        [_chooseButton setImage:MImage(@"on") forState:BtnStateSelected];
        _chooseButton.imageEdgeInsets = UIEdgeInsetsMake(0, AutoWidth(5), 0, 0);
        _chooseButton.layer.cornerRadius = 10;
        [_chooseButton addTarget:self action:@selector(choose:) forControlEvents:BtnTouchUpInside];
    }
    return _chooseButton;
}

- (UIImageView *)goodIV{
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_chooseButton), AutoWidth(12), AutoWidth(77), AutoWidth(77))];
        _goodIV.backgroundColor = LH_RandomColor;
        _goodIV.layer.borderWidth = 0.5;
        _goodIV.layer.borderColor = __BackColor.CGColor;
    }
    return _goodIV;
}

- (LSChangeCountView *)changeCountV{
    if (!_changeCountV) {
        _changeCountV = [[LSChangeCountView alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(20), AutoWidth(10), AutoWidth(160), AutoWidth(30))];
        _changeCountV.delegate = self;

    }
    return _changeCountV;
}

- (UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(60), 0, AutoWidth(60), AutoWidth(99))];
        _deleteButton.backgroundColor = __DefaultColor;
        _deleteButton.titleLabel.font = MFont(AutoWidth(15));
        [_deleteButton setTitle:@"删除" forState:BtnNormal];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_deleteButton setImage:MImage(@"delete") forState:BtnNormal];
        _deleteButton.titleEdgeInsets = UIEdgeInsetsMake(AutoWidth(30), -AutoWidth(30), 0, 0);
        _deleteButton.imageEdgeInsets = UIEdgeInsetsMake(0, AutoWidth(10), AutoWidth(20), 0);
        [_deleteButton addTarget:self action:@selector(deleteGood) forControlEvents:BtnTouchUpInside];
    }
    return _deleteButton;
}

- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(99), __kWidth-AutoWidth(20), AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (void)choose:(UIButton*)sender{
    sender.selected = !sender.selected;
    [self.delegate chooseEdit:sender.selected index:self.tag];
}

- (void)deleteGood{
    [self.delegate deleteGood:self.tag];
}


#pragma mark ==LSChangeCountViewDelegate==
- (void)changeCount:(BOOL)sender{
    [self.delegate goodCount:sender changeIndex:self.tag];
}

- (void)setModel:(LSShopGoodModel *)model{
    _model = model;
//  [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_model.goodUrl]]];
    _chooseButton.selected = _model.isChoose;
    _changeCountV.count = _model.goodNum;
}


@end
