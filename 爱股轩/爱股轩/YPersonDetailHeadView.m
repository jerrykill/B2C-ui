//
//  YPersonDetailHeadView.m
//  优胜办公
//
//  Created by imac on 2016/12/17.
//  Copyright © 2016年 联系QQ:1084356436. All rights reserved.
//

#import "YPersonDetailHeadView.h"

@interface YPersonDetailHeadView ()

@property (strong,nonatomic) UIButton *titleBtn;

@property (strong,nonatomic) UIButton *detailBtn;


@end

@implementation YPersonDetailHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

-(void)initView{
    _titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(100), AutoWidth(20))];
    [self addSubview:_titleBtn];
    [_titleBtn setTitle:@"我的订单" forState:BtnNormal];
    _titleBtn.titleLabel.font = MFont(AutoWidth(15));
    [_titleBtn setTitleColor:__DTextColor forState:BtnNormal];
    [_titleBtn setImage:MImage(@"Orders_ico") forState:BtnNormal];
    _titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, AutoWidth(70));
    _titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [_titleBtn addTarget:self action:@selector(titleAction) forControlEvents:BtnTouchUpInside];

    _detailBtn = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-90, AutoWidth(15), AutoWidth(90), AutoWidth(20))];
    [self addSubview:_detailBtn];
    [_detailBtn setTitle:@"查看订单" forState:BtnNormal];
    _detailBtn.titleLabel.font = MFont(AutoWidth(13));
    [_detailBtn setTitleColor:LH_RGBCOLOR(117, 117, 117) forState:BtnNormal];
    [_detailBtn setImage:MImage(@"arrow") forState:BtnNormal];
    [_detailBtn addTarget:self action:@selector(detailAction) forControlEvents:BtnTouchUpInside];
    _detailBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, AutoWidth(20));
    _detailBtn.imageEdgeInsets = UIEdgeInsetsMake(0, AutoWidth(65), 0, 0);
    
}

#pragma mark ==懒加载==
-(void)setTitle:(NSString *)title{
   [_titleBtn setTitle:title forState:BtnNormal];
    if ([title isEqualToString:@"我的钱包"]) {
        [_titleBtn setImage:MImage(@"wallet_ico") forState:BtnNormal];
        [_detailBtn setTitle:@"查看详情" forState:BtnNormal];
    }
}

-(void)setDetail:(NSString *)detail{
   [_detailBtn setTitle:detail forState:BtnNormal];
}

#pragma mark ==标题==
- (void)titleAction{
//    [self.delegate headTitleActionType:self.tag];
}


#pragma mark ==细节==
- (void)detailAction{
    [self.delegate headDetailActionType:self.tag];
}

@end
