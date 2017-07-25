//
//  LSGoodDetailTypeChooseView.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailTypeChooseView.h"
#import "LSOrderTypeButton.h"

@interface LSGoodDetailTypeChooseView ()

@property (strong,nonatomic) NSMutableArray *btnArr;

@end

@implementation LSGoodDetailTypeChooseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _btnArr =[NSMutableArray array];
        [self initView];
    }
    return self;
}

- (void)initView {
    NSArray *titleArr = @[@"图文详情",@"规格参数",@"商品评论"];
    for (int i=0; i<titleArr.count; i++) {
        LSOrderTypeButton *btn= [[LSOrderTypeButton alloc]initWithFrame:CGRectMake(__kWidth/3*i, 0, __kWidth/3, AutoWidth(38))];
        [self addSubview:btn];
        btn.tag = i;
        btn.titleLabel.font = MFont(AutoWidth(13));
        [btn setTitleColor:__DTextColor forState:BtnNormal];
        [btn setTitleColor:__DTextColor forState:BtnStateSelected];
        [btn setTitle:titleArr[i] forState:BtnNormal];
        [btn setTitle:titleArr[i] forState:BtnStateSelected];
        [_btnArr addObject:btn];
        if (!i) {
            btn.lineIV.backgroundColor = __DefaultColor;
            btn.selected = YES;
            btn.titleLabel.font = MFont(AutoWidth(15));
            btn.userInteractionEnabled = NO;
        }
        [btn addTarget:self action:@selector(chooseType:) forControlEvents:BtnTouchUpInside];


    }
}

-(void)chooseType:(UIButton*)sender{
    sender.selected = !sender.selected;
    for (LSOrderTypeButton *btn in _btnArr) {
        if (btn.tag==sender.tag) {
            btn.lineIV.backgroundColor = __DefaultColor;
            btn.titleLabel.font = MFont(AutoWidth(15));
            btn.userInteractionEnabled = NO;
        }else{
            btn.selected = NO;
            btn.titleLabel.font = MFont(AutoWidth(13));
            btn.lineIV.backgroundColor = [UIColor whiteColor];
            btn.userInteractionEnabled = YES;
        }
    }
    [self.delegate chooseDetailType:sender.tag];
}

- (void)setSelectType:(NSInteger)selectType {
    for (LSOrderTypeButton *btn in _btnArr) {
        if (btn.tag==selectType) {
            btn.lineIV.backgroundColor = __DefaultColor;
            btn.titleLabel.font = MFont(AutoWidth(15));
            btn.userInteractionEnabled = NO;
        }else{
            btn.selected = NO;
            btn.titleLabel.font = MFont(AutoWidth(13));
            btn.lineIV.backgroundColor = [UIColor whiteColor];
            btn.userInteractionEnabled = YES;
        }
    }

}

@end
