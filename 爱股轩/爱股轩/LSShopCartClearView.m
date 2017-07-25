//
//  LSShopCartClearView.m
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopCartClearView.h"

@interface LSShopCartClearView ()

@property (strong,nonatomic) UIButton *allChooseButton;

@property (strong,nonatomic) UILabel *trueLabel;

@property (strong,nonatomic) UILabel *totalLabel;

@property (strong,nonatomic) UIButton *clearButton;

@end

@implementation LSShopCartClearView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.allChooseButton];
    [self addSubview:self.trueLabel];
    [self addSubview:self.totalLabel];
    [self addSubview:self.clearButton];
}

#pragma mark ==懒加载==
- (UIButton *)allChooseButton{
    if (!_allChooseButton) {
        _allChooseButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(90), AutoWidth(22))];
        _allChooseButton.titleLabel.font = MFont(AutoWidth(14));
        [_allChooseButton setTitle:@"全选" forState:BtnNormal];
        [_allChooseButton setTitle:@"取消全选" forState:BtnStateSelected];
        [_allChooseButton setTitleColor:LH_RGBCOLOR(153, 153, 153) forState:BtnNormal];
        [_allChooseButton setTitleColor:LH_RGBCOLOR(153, 153, 153) forState:BtnStateSelected];
        [_allChooseButton setImage:MImage(@"off") forState:BtnNormal];
        [_allChooseButton setImage:MImage(@"on") forState:BtnStateSelected];
        _allChooseButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, AutoWidth(70));
        _allChooseButton.titleEdgeInsets = UIEdgeInsetsMake(0, -AutoWidth(5), 0, 0);
        [_allChooseButton addTarget:self action:@selector(chooseAll:) forControlEvents:BtnTouchUpInside];
    }
    return _allChooseButton;
}

- (UILabel *)trueLabel{
    if (!_trueLabel) {
        _trueLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(100), AutoWidth(5), AutoWidth(130), AutoWidth(20))];
        _trueLabel.textAlignment = NSTextAlignmentRight;
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:@"总计：¥0.00"];
        [attri addAttribute:NSForegroundColorAttributeName value:__TextColor range:NSMakeRange(0, 3)];
        [attri addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(3, 5)];
        [attri addAttribute:NSFontAttributeName value:MFont(AutoWidth(15)) range:NSMakeRange(0, 4)];
        [attri addAttribute:NSFontAttributeName value:MFont(AutoWidth(18)) range:NSMakeRange(4, 1)];
        [attri addAttribute:NSFontAttributeName value:MFont(AutoWidth(15)) range:NSMakeRange(5, 3)];
        _trueLabel.attributedText = attri;
    }
    return _trueLabel;
}

- (UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(100), CGRectYH(_trueLabel), AutoWidth(130), AutoWidth(15))];
        _trueLabel.textColor = LH_RGBCOLOR(170, 170, 170);
        _totalLabel.font =MFont(AutoWidth(10));
        _totalLabel.textAlignment = NSTextAlignmentRight;
        _totalLabel.text = @"总额:¥0.00 优惠:¥0.00";
    }
    return _totalLabel;
}

- (UIButton *)clearButton{
    if (!_clearButton) {
        _clearButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(125), 0, AutoWidth(125), AutoWidth(50))];
        _clearButton.backgroundColor = HEXCOLOR(0xce0a14);
        _clearButton.titleLabel.font = MFont(AutoWidth(20));
        [_clearButton setTitle:@"去结算" forState:BtnNormal];
        [_clearButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_clearButton addTarget:self action:@selector(choose) forControlEvents:BtnTouchUpInside];
    }
    return _clearButton;
}


- (void)chooseAll:(UIButton*)sender{
    sender.selected = !sender.selected;
    [self.delegate chooseAll:sender.selected];
}

- (void)choose{
    [self.delegate clearPay];
}

- (void)setAllchoose:(BOOL)allchoose{
    _allChooseButton.selected = allchoose;
}

- (void)setModel:(LSShopCartGoodModel *)model{
    _model = model;
    NSString *price = [NSString stringWithFormat:@"%.2f",[_model.totalMoney floatValue]-[_model.couponMoney floatValue]];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"总计：¥%@",price]];
    [attri addAttribute:NSForegroundColorAttributeName value:__TextColor range:NSMakeRange(0, 3)];
    [attri addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(3, price.length+1)];
    [attri addAttribute:NSFontAttributeName value:MFont(15) range:NSMakeRange(0, 4)];
    [attri addAttribute:NSFontAttributeName value:MFont(18) range:NSMakeRange(4, attri.length-7)];
    [attri addAttribute:NSFontAttributeName value:MFont(15) range:NSMakeRange(attri.length-3, 3)];
    _trueLabel.attributedText = attri;
    _totalLabel.text = [NSString stringWithFormat:@"总额:¥%@ 优惠:¥%@",_model.totalMoney,_model.couponMoney];
    if ([_model.chooseCount isEqualToString:@"0"]) {
        [_clearButton setTitle:@"去结算" forState:BtnNormal];
    }else{
        [_clearButton setTitle:[NSString stringWithFormat:@"去结算(%@)",_model.chooseCount] forState:BtnNormal];
    }
}


@end


