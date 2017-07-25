//
//  LSPictureInputView.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSPictureInputView.h"

@interface LSPictureInputView ()<UITextFieldDelegate>

@property (strong,nonatomic) UIView *backV;

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UITextField *inputTextfiled;

@property (strong,nonatomic) UIImageView *codeIV;

@property (strong,nonatomic) UIButton *changeButton;

@end

@implementation LSPictureInputView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.backV];
    _backV.userInteractionEnabled = YES;
    [_backV addSubview:self.headIV];
    [_backV addSubview:self.inputTextfiled];
    [_backV addSubview:self.codeIV];
    [self addSubview:self.changeButton];
}

#pragma mark ==懒加载==
- (UIView *)backV{
    if (!_backV) {
        _backV = [[UIView alloc]initWithFrame:CGRectMake(AutoWidth(30), 0, AutoWidth(165),AutoWidth(55))];
        _backV.backgroundColor = __BackColor;
        _backV.layer.cornerRadius = 4;
    }
    return _backV;
}

- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(17.5), AutoWidth(17), AutoWidth(22), AutoWidth(24))];
        _headIV.image =MImage(@"verification_icon_login");
        _headIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _headIV;
}

- (UITextField *)inputTextfiled{
    if (!_inputTextfiled) {
        _inputTextfiled = [[UITextField alloc]initWithFrame:CGRectMake(AutoWidth(60), AutoWidth(15), AutoWidth(105), AutoWidth(25))];
        _inputTextfiled.font = MFont(AutoWidth(14));
        _inputTextfiled.delegate = self;
        _inputTextfiled.placeholder = @"图片验证码";
        _inputTextfiled.textAlignment = NSTextAlignmentLeft;
    }
    return _inputTextfiled;
}

- (UIImageView *)codeIV{
    if (!_codeIV) {
        _codeIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_inputTextfiled)+AutoWidth(10), AutoWidth(15), AutoWidth(80), AutoWidth(20))];
        _codeIV.backgroundColor = LH_RandomColor;
    }
    return _codeIV;
}

- (UIButton *)changeButton{
    if (!_changeButton) {
        _changeButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_codeIV)+AutoWidth(38), 0, AutoWidth(50), AutoWidth(55))];
        _changeButton.titleLabel.font = MFont(15);
        _changeButton.userInteractionEnabled = YES;
        [_changeButton setTitle:@"换一张" forState:BtnNormal];
        [_changeButton setTitleColor:LH_RGBCOLOR(169, 169, 169) forState:BtnNormal];
        [_changeButton addTarget:self action:@selector(changePicture) forControlEvents:BtnTouchUpInside];
    }
    return _changeButton;
}

- (void)changePicture{
    [self.delegate changeNextPic];
}

#pragma mark ==UItextFiledDelegate==
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (!IsNilString(textField.text)) {
        [self.delegate getThePictureCode:textField.text];
    }
    return YES;
}



@end
