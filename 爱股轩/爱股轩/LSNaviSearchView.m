//
//  LSNaviSearchView.m
//  优胜办公
//
//  Created by imac on 2017/3/31.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSNaviSearchView.h"

@interface LSNaviSearchView ()<UITextFieldDelegate>
{
    CGRect _frame;
}
@property (strong,nonatomic) UIView *backV;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) UITextField *searchTextfiled;


@end

@implementation LSNaviSearchView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _frame =frame;
        [self initView];
    }
    return self;
}


-(void)initView{
    [self addSubview:self.backV];
    [self sendSubviewToBack:_backV];
    [self addSubview:self.logoIV];
    [self addSubview:self.searchTextfiled];

}

#pragma mark ==懒加载==
-(UIView *)backV{
    if (!_backV) {
        _backV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height)];
        _backV.backgroundColor= [UIColor whiteColor];
        _backV.alpha = 0.3;
        _backV.layer.cornerRadius = _frame.size.height/2;
    }
    return _backV;
}

-(UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 8, 15, 15)];
        _logoIV.image = MImage(@"search_icon");
        _logoIV.contentMode = UIViewContentModeScaleAspectFit;
        _logoIV.layer.masksToBounds= YES;
    }
    return _logoIV;
}

-(UITextField *)searchTextfiled{
    if (!_searchTextfiled) {
        _searchTextfiled = [[UITextField alloc]initWithFrame:CGRectMake(CGRectXW(_logoIV)+5, 7, _frame.size.width-40, 20)];
        _searchTextfiled.delegate = self;
        _searchTextfiled.textColor = [UIColor whiteColor];
        _searchTextfiled.font = MFont(AutoWidth(14));
        _searchTextfiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:@"搜索宝贝、课程、讲师..."];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attr.length)];
        _searchTextfiled.attributedPlaceholder = attr;
    }
    return _searchTextfiled;
}

#pragma mark ==UITextFiledDelegate==
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self.delegate startSearch];
    return NO;
}



@end
