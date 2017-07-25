//
//  LSLoginInputView.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSLoginInputView.h"

@interface LSLoginInputView ()<UITextFieldDelegate>

@property (strong,nonatomic) UIView *backV;

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UITextField *inputTextFiled;

@end

@implementation LSLoginInputView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.backV];
    [_backV addSubview:self.headIV];
    [_backV addSubview:self.inputTextFiled];
}

#pragma mark == 懒加载==
- (UIView *)backV{
    if (!_backV) {
        _backV = [[UIView alloc]initWithFrame:CGRectMake(AutoWidth(30), 0, AutoWidth(315), AutoWidth(55))];
        _backV.backgroundColor = __BackColor;
        _backV.layer.cornerRadius =4;

    }
    return _backV;
}

- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(17), AutoWidth(15), AutoWidth(23), AutoWidth(28))];
        
    }
    return _headIV;
}

- (UITextField *)inputTextFiled{
    if (!_inputTextFiled) {
        _inputTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(AutoWidth(60), AutoWidth(15), AutoWidth(235), AutoWidth(25))];
        _inputTextFiled.font = MFont(AutoWidth(14));
        _inputTextFiled.delegate = self;
        _inputTextFiled.textAlignment = NSTextAlignmentLeft;
    }
    return _inputTextFiled;
}

-(void)setPlaceholder:(NSString *)placeholder{
    _inputTextFiled.placeholder = placeholder;
}

-(void)setHeadFrame:(CGRect)headFrame{
    _headIV.frame = CGRectMake(headFrame.origin.x, headFrame.origin.y, headFrame.size.width, headFrame.size.height);
}

- (void)setImageName:(NSString *)imageName{
    _headIV.image = MImage(imageName);
}

#pragma mark ==UITextFiledDelegate==
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (!IsNilString(textField.text)) {
        [self.delegate getTheinput:textField.text index:self.tag];
    }
    return YES;
}


@end
