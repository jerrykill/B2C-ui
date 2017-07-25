//
//  LSLoginSMSInputView.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSLoginSMSInputView.h"

@interface LSLoginSMSInputView ()<UITextFieldDelegate>

@property (strong,nonatomic) UIView *backV;

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UITextField *inputTextFiled;

@property (strong,nonatomic) UIButton *codeButton;

@end

@implementation LSLoginSMSInputView

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
    [_backV addSubview:self.codeButton];
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
        _inputTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(AutoWidth(60), AutoWidth(15), AutoWidth(165), AutoWidth(25))];
        _inputTextFiled.font = MFont(AutoWidth(14));
        _inputTextFiled.delegate = self;
        _inputTextFiled.placeholder = @"请输入短信验证码";
        _inputTextFiled.textAlignment = NSTextAlignmentLeft;
    }
    return _inputTextFiled;
}

- (UIButton *)codeButton{
    if (!_codeButton) {
        _codeButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_inputTextFiled), AutoWidth(2), AutoWidth(88), AutoWidth(51))];
        _codeButton.titleLabel.font = MFont(AutoWidth(13));
        [_codeButton setTitle:@"获取验证码" forState:BtnNormal];
        [_codeButton setTitleColor:__DTextColor forState:BtnNormal];
        _codeButton.backgroundColor = [UIColor whiteColor];
        _codeButton.layer.cornerRadius = 4;
        [_codeButton addTarget:self action:@selector(getCode) forControlEvents:BtnTouchUpInside];
    }
    return _codeButton;
}

- (void)setImageName:(NSString *)imageName{
    _headIV.image = MImage(imageName);
}

- (void)setHeadFrame:(CGRect)headFrame{
    _headIV.frame = CGRectMake(headFrame.origin.x, headFrame.origin.y, headFrame.size.width, headFrame.size.height);
}

- (void)setPlaceholder:(NSString *)placeholder{
    _inputTextFiled.placeholder = placeholder;
}

#pragma mark ==获取验证码==
- (void)getCode{
    [self.delegate getSMSCode];
}
#pragma mark ==UITextFiledDelegate==
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (!IsNilString(textField.text)) {
        [self.delegate getInputSMSCode:textField.text];
    }
    return YES;
}


@end
