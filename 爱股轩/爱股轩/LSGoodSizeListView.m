//
//  LSGoodSizeListView.m
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodSizeListView.h"
#import "LSGoodDetailSizeCell.h"
#import "LSGoodDetailNumCell.h"


@interface LSGoodSizeListView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LSGoodDetailNumCellDelegate,LSGoodDetailSizeCellDelegate>

@property (strong,nonatomic) UIView *headV;

@property (strong,nonatomic) UIView *backV;

@property (strong,nonatomic) UIImageView *goodIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *priceLabel;

@property (strong,nonatomic) UIButton *cancelButton;

@property (strong,nonatomic) UICollectionView *typeV;

@property (strong,nonatomic) UILabel *totalLabel;

@property (strong,nonatomic) UIButton *addShopButton;

@property (strong,nonatomic) UIButton *payButton;


@end

@implementation LSGoodSizeListView

- (void)setData:(LSGoodDetailModel *)data {
    _data=data;
//    [_goodIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,data.goodUrl]]];
    _titleLabel.text = data.goodTitle;
    _priceLabel.text = [NSString stringWithFormat:@"¥%@",data.goodMoney];;

}

- (void)setModel:(LSGoodModel *)model {
    _model = model;
    _titleLabel.text = model.goodName;
    _priceLabel.text = [NSString stringWithFormat:@"¥%@",model.goodPrice];;
    [self makeTotal];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.headV];
    [self addSubview:self.backV];
    [self sendSubviewToBack:_backV];
    [self addSubview:self.goodIV];
    [_backV addSubview:self.titleLabel];
    [_backV addSubview:self.priceLabel];
    [_backV addSubview:self.cancelButton];
    [_backV addSubview:self.typeV];
    [_backV addSubview:self.totalLabel];
    [self addSubview:self.addShopButton];
    [self addSubview:self.payButton];

    //注册
    [_typeV registerClass:[LSGoodDetailSizeCell class]
            forCellWithReuseIdentifier:@"LSGoodDetailSizeCell"];
    [_typeV registerClass:[LSGoodDetailNumCell class]
            forCellWithReuseIdentifier:@"LSGoodDetailNumCell"];
    
}

#pragma mark ==懒加载==
- (UIView *)headV {
    if (!_headV) {
         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseCancel)];
        _headV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, __kWidth,__kHeight-AutoWidth(320)-50)];
        [_headV addGestureRecognizer:tap];
        _headV.backgroundColor = [UIColor blackColor];
        _headV.alpha = 0.2;
    }
    return _headV;
}

- (UIView *)backV {
    if (!_backV) {
        _backV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectYH(_headV), __kWidth, AutoWidth(320))];
        _backV .backgroundColor = [UIColor whiteColor];
    }
    return _backV;
}

- (UIImageView *)goodIV {
    if (!_goodIV) {
        _goodIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), __kHeight-AutoWidth(320)-60, AutoWidth(88), AutoWidth(88))];
        _goodIV.layer.cornerRadius = AutoWidth(5);
        _goodIV.layer.borderWidth = 0.5;
        _goodIV.backgroundColor = LH_RandomColor;
        _goodIV.layer.borderColor = __BackColor.CGColor;
        _goodIV.layer.masksToBounds = YES;
    }
    return _goodIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(8), AutoWidth(18), AutoWidth(235), AutoWidth(36))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = MFont(AutoWidth(13));
        _titleLabel.textColor = __DTextColor;
    }
    return _titleLabel;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(25), AutoWidth(10), AutoWidth(17), AutoWidth(17))];
        _cancelButton.layer.cornerRadius = AutoWidth(8.5);
        _cancelButton.layer.borderWidth = 1;
        _cancelButton.layer.borderColor = LH_RGBCOLOR(186, 186, 186).CGColor;
        [_cancelButton setTitle:@"×" forState:BtnNormal];
        _cancelButton.titleLabel.font = MFont(AutoWidth(15));
        [_cancelButton setTitleColor:LH_RGBCOLOR(186, 186, 186) forState:BtnNormal];
        [_cancelButton addTarget:self action:@selector(chooseCancel) forControlEvents:BtnTouchUpInside];
    }
    return _cancelButton;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_goodIV)+AutoWidth(8), CGRectYH(_titleLabel)+AutoWidth(8), AutoWidth(220), AutoWidth(15))];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = __DefaultColor;
    }
    return _priceLabel;
}

- (UICollectionView *)typeV {
    if (!_typeV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _typeV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, AutoWidth(98), __kWidth, AutoWidth(162)) collectionViewLayout:flowLayout];
        _typeV.delegate = self;
        _typeV.dataSource = self;
        _typeV.backgroundColor = [UIColor whiteColor];

    }
    return _typeV;
}

- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10),CGRectYH(_typeV) +AutoWidth(12), AutoWidth(343), AutoWidth(20))];
        _totalLabel.textAlignment = NSTextAlignmentRight;
        _totalLabel.font = MFont(AutoWidth(15));
    }
    return _totalLabel;
}

- (UIButton *)addShopButton {
    if (!_addShopButton) {
        _addShopButton = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectYH(_backV), __kWidth/2, 50)];
        _addShopButton.backgroundColor = LH_RGBCOLOR(255, 114, 0);
        _addShopButton.titleLabel.font = MFont(AutoWidth(16));
        [_addShopButton setTitle:@"加入购物车" forState:BtnNormal];
        [_addShopButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_addShopButton addTarget:self action:@selector(addShop) forControlEvents:BtnTouchUpInside];
    }
    return _addShopButton;
}

- (UIButton *)payButton {
    if (!_payButton) {
        _payButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_addShopButton), CGRectY(_addShopButton), __kWidth/2, 50)];
        _payButton.backgroundColor = LH_RGBCOLOR(207, 29, 27);
        _payButton.titleLabel.font = MFont(AutoWidth(16));
        [_payButton setTitle:@"马上购买" forState:BtnNormal];
        [_payButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_payButton addTarget:self action:@selector(payMoney) forControlEvents:BtnTouchUpInside];
    }
    return _payButton;
}

#pragma mark ==UICollectionViewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cells =  nil;
    if (indexPath.row==0) {
        LSGoodDetailSizeCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSGoodDetailSizeCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSGoodDetailSizeCell alloc]init];
        }
        cell.btnArr = _data.typeArr;
        cell.delegate = self;
        cells = cell;
    }else{
        LSGoodDetailNumCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSGoodDetailNumCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSGoodDetailNumCell alloc]init];
        }
        cell.stock = @"7";
        cell.num = @"1";
        cell.delegate = self;
        cells = cell;
    }
    return cells;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

//y
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//x
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        CGFloat width = AutoWidth(25);
        CGFloat height = AutoWidth(38);
        for (int i=0; i<_data.typeArr.count; i++) {
            NSString *str = _data.typeArr[i];
            CGFloat length = [self convertToInt:str]+2;
            if (length*AutoWidth(15)+width>__kWidth-AutoWidth(50)) {
                height +=AutoWidth(50);
                width=AutoWidth(25);
            }else{
                width +=length*AutoWidth(15)+AutoWidth(15);
            }
        }
        return CGSizeMake(__kWidth, height+AutoWidth(50));
    }else{
        return CGSizeMake(__kWidth, AutoWidth(70));
    }
}



#pragma mark ==LSGoodDetailNumCellDelegate==
-(void)changeGoodNum:(BOOL)sender{
    [self.delegate changeGoodCount:sender];
}
#pragma mark ==LSGoodDetailSizeCellDelegate==
- (void)chooseGoodSize:(NSInteger)index {
    [self.delegate chooseGoodCheckType:index];
}


#pragma mark ==取消==
- (void)chooseCancel{
    [self removeFromSuperview];
}

#pragma mark ==加入购物车==
- (void)addShop {
    [self.delegate addShopCart];
}

#pragma mark ==立即购买==
- (void)payMoney {
    [self.delegate payNow];
}

- (void)makeTotal{
    NSString *totalMoney = [NSString stringWithFormat:@"%.2f",[_model.goodPrice floatValue]*[_model.num integerValue]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"共%ld件共计¥%@",[_model.num integerValue],totalMoney]];
    [attr addAttribute:NSFontAttributeName value:MFont(16) range:NSMakeRange(0, 5+_model.num.length)];
    [attr addAttribute:NSFontAttributeName value:MFont(18) range:NSMakeRange(5+_model.num.length, totalMoney.length-3)];
    [attr addAttribute:NSFontAttributeName value:MFont(16) range:NSMakeRange(totalMoney.length+2+_model.num.length, 3)];
    [attr addAttribute:NSForegroundColorAttributeName value:LH_RGBCOLOR(102, 102, 102) range:NSMakeRange(0, 1)];
    [attr addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(1, _model.num.length)];
    [attr addAttribute:NSForegroundColorAttributeName value:LH_RGBCOLOR(102, 102, 102) range:NSMakeRange(_model.num.length+1, 3)];
    [attr addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(_model.num.length+4, totalMoney.length+1)];
    _totalLabel.attributedText = attr;
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


@end
