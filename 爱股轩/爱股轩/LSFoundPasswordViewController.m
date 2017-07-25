//
//  LSFoundPasswordViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSFoundPasswordViewController.h"
#import "LSLoginNaviView.h"
#import "LSLoginInputView.h"
#import "LSLoginSMSInputView.h"
#import "LSPictureInputView.h"

@interface LSFoundPasswordViewController ()<LSLoginNaviViewDelegate,LSLoginInputViewDelegate,LSLoginSMSInputViewDelegate,LSPictureInputViewDelegate>

@property (strong,nonatomic) LSLoginNaviView *naviV;

@property (strong,nonatomic) LSLoginInputView *phoneInputV;

@property (strong,nonatomic) LSLoginSMSInputView *codeInputV;

@property (strong,nonatomic) LSPictureInputView *picInputV;

@property (strong,nonatomic) UIButton *foundButton;

@end

@implementation LSFoundPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.naviV];
    [self initView];

}
- (void)initView {
    [self.view addSubview:self.phoneInputV];
    [self.view addSubview:self.codeInputV];
    [self.view addSubview:self.picInputV];
    [self.view addSubview:self.foundButton];
}

#pragma mark ==懒加载==
- (LSLoginNaviView *)naviV {
    if (!_naviV) {
        _naviV = [[LSLoginNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.delegate = self;
        _naviV.cancel = @"返回";
        _naviV.title = @"找回密码";
        
    }
    return _naviV;
}

- (LSLoginInputView *)phoneInputV {
    if (!_phoneInputV) {
        _phoneInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, 64+AutoWidth(20), __kWidth, AutoWidth(70))];
        _phoneInputV.tag =1;
        _phoneInputV.placeholder = @"已验证手机号";
        _phoneInputV.imageName = @"iPhone_icon_login";
        _phoneInputV.headFrame = CGRectMake(AutoWidth(19), AutoWidth(16.5), AutoWidth(18), AutoWidth(25));
        _phoneInputV.delegate = self;
    }
    return _phoneInputV;
}

- (LSLoginSMSInputView *)codeInputV {
    if (!_codeInputV) {
        _codeInputV = [[LSLoginSMSInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_phoneInputV), __kWidth, AutoWidth(70))];
        _codeInputV.placeholder = @"短信验证码";
        _codeInputV.imageName = @"sms_icon_login";
        _codeInputV.headFrame = CGRectMake(AutoWidth(17.5), AutoWidth(20.5), AutoWidth(21), AutoWidth(17));
        _codeInputV.delegate = self;
    }
    return _codeInputV;
}

- (LSPictureInputView *)picInputV {
    if (!_picInputV) {
        _picInputV = [[LSPictureInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_codeInputV), __kWidth, AutoWidth(70))];
        _picInputV.delegate = self;
    }
    return _picInputV;
}

- (UIButton *)foundButton {
    if (!_foundButton) {
        _foundButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(30), CGRectYH(_picInputV)+AutoWidth(15), AutoWidth(315), AutoWidth(54))];
        _foundButton.layer.cornerRadius = AutoWidth(27);
        _foundButton.gradientColor = @"yes";
        _foundButton.titleLabel.font = BFont(AutoWidth(19));
        [_foundButton setTitle:@"找回密码" forState:BtnNormal];
        [_foundButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_foundButton addTarget:self action:@selector(chooseFound) forControlEvents:BtnTouchUpInside];
    }
    return _foundButton;
}

#pragma mark ==LSLoginNaviViewDelegate==
- (void)naviBack {
    [self back];
}

#pragma mark ==LSLoginInputViewDelegate==
- (void)getTheinput:(NSString *)text index:(NSInteger)index{
    NSLog(@"手机号%@",text);
}

#pragma mark ==LSLoginSMSInputViewDelegate==
- (void)getInputSMSCode:(NSString *)text{
    NSLog(@"验证码%@",text);
}

- (void)getSMSCode{
    NSLog(@"获取验证码");
}
#pragma mark ==LSPictureInputViewDelegate==
- (void)getThePictureCode:(NSString *)sender{
    NSLog(@"图片验证码%@",sender);
}

- (void)changeNextPic {
    NSLog(@"换一张");
}

#pragma mark ==找回密码==
- (void)chooseFound {
    NSLog(@"找回密码");
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return  UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
