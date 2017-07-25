//
//  LSRegisterViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSRegisterViewController.h"
#import "LSLoginNaviView.h"
#import "LSLoginInputView.h"
#import "LSLoginSMSInputView.h"

@interface LSRegisterViewController ()<LSLoginNaviViewDelegate,LSLoginInputViewDelegate,LSLoginSMSInputViewDelegate>

@property (strong,nonatomic) LSLoginNaviView *naviV;

@property (strong,nonatomic) UIScrollView *backV;

@property (strong,nonatomic) LSLoginInputView *nameinputV;

@property (strong,nonatomic) LSLoginInputView *phoneInputV;

@property (strong,nonatomic) LSLoginSMSInputView *codeInputV;

@property (strong,nonatomic) LSLoginInputView *passwordInputV;

@property (strong,nonatomic) LSLoginInputView *rePasswordInputV;

@property (strong,nonatomic) LSLoginInputView *emailInputV;

@property (strong,nonatomic) LSLoginInputView *recommendInputV;

@property (strong,nonatomic) UIButton *registerButton;

@property (strong,nonatomic) UIButton *hadButton;

@end

@implementation LSRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.naviV];
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.backV];
    [_backV addSubview:self.nameinputV];
    [_backV addSubview:self.phoneInputV];
    [_backV addSubview:self.codeInputV];
    [_backV addSubview:self.passwordInputV];
    [_backV addSubview:self.rePasswordInputV];
    [_backV addSubview:self.emailInputV];
    [_backV addSubview:self.recommendInputV];
    [_backV addSubview:self.registerButton];
    [_backV addSubview:self.hadButton];
}

#pragma mark ==懒加载==
- (LSLoginNaviView *)naviV{
    if (!_naviV) {
        _naviV = [[LSLoginNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.delegate = self;
        _naviV.title = @"爱股轩注册";
    }
    return _naviV;
}

- (UIScrollView *)backV{
    if (!_backV) {
        _backV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-64)];
        _backV.backgroundColor = [UIColor whiteColor];
        _backV.contentSize = CGSizeMake(__kWidth, AutoWidth(603));
    }
    return _backV;
}

- (LSLoginInputView *)nameinputV{
    if (!_nameinputV) {
        _nameinputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, AutoWidth(11), __kWidth, AutoWidth(70))];
        _nameinputV.imageName = @"user_icon_login";
        _nameinputV.placeholder = @"请输入用户名...";
        _nameinputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(15), AutoWidth(22), AutoWidth(28));
        _nameinputV.tag = 1;
        _nameinputV.delegate = self;
    }
    return _nameinputV;
}

- (LSLoginInputView *)phoneInputV{
    if (!_phoneInputV) {
        _phoneInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_nameinputV), __kWidth, AutoWidth(70))];
        _phoneInputV.imageName = @"iPhone_icon_login";
        _phoneInputV.placeholder = @"请输入验证手机号码...";
        _phoneInputV.headFrame = CGRectMake(AutoWidth(19), AutoWidth(16), AutoWidth(18), AutoWidth(25));
        _phoneInputV.tag = 2;
        _phoneInputV.delegate = self;
    }
    return _phoneInputV;
}

- (LSLoginSMSInputView *)codeInputV{
    if (!_codeInputV) {
        _codeInputV = [[LSLoginSMSInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_phoneInputV), __kWidth, AutoWidth(70))];
        _codeInputV.imageName = @"sms_icon_login";
        _codeInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(20), AutoWidth(21), AutoWidth(17));
        _codeInputV.delegate = self;
    }
    return _codeInputV;
}

- (LSLoginInputView *)passwordInputV{
    if (!_passwordInputV) {
        _passwordInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_codeInputV), __kWidth, AutoWidth(70))];
        _passwordInputV.imageName = @"password_icon_login";
        _passwordInputV.placeholder = @"请输入密码...";
        _passwordInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(16), AutoWidth(22), AutoWidth(26));
        _passwordInputV.tag = 3;
        _passwordInputV.delegate = self;
    }
    return _passwordInputV;
}

- (LSLoginInputView *)rePasswordInputV{
    if (!_rePasswordInputV) {
        _rePasswordInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_passwordInputV), __kWidth, AutoWidth(70))];
        _rePasswordInputV.imageName = @"password_icon_login";
        _rePasswordInputV.placeholder = @"请再次确认密码...";
        _rePasswordInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(16), AutoWidth(22), AutoWidth(26));
        _rePasswordInputV.tag = 4;
        _rePasswordInputV.delegate = self;
    }
    return _rePasswordInputV;
}

- (LSLoginInputView *)emailInputV{
    if (!_emailInputV) {
        _emailInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_rePasswordInputV), __kWidth, AutoWidth(70))];
        _emailInputV.imageName = @"sms_icon_login";
        _emailInputV.placeholder = @"请输入邮箱地址...";
        _emailInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(20), AutoWidth(21), AutoWidth(17));
        _emailInputV.tag = 5;
        _emailInputV.delegate = self;
    }
    return _emailInputV;
}

- (LSLoginInputView *)recommendInputV{
    if (!_recommendInputV) {
        _recommendInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_emailInputV), __kWidth, AutoWidth(70))];
        _recommendInputV.imageName = @"recommend_icon_login";
        _recommendInputV.placeholder = @"选填推荐码";
        _recommendInputV.headFrame = CGRectMake(AutoWidth(15), AutoWidth(17), AutoWidth(25), AutoWidth(23));
        _recommendInputV.tag = 6;
        _recommendInputV.delegate = self;
    }
    return _recommendInputV;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(30), CGRectYH(_recommendInputV), AutoWidth(315), AutoWidth(54))];
        _registerButton.layer.cornerRadius = AutoWidth(27);
        _registerButton.gradientColor = @"yes";
        _registerButton.titleLabel.font = BFont(AutoWidth(19));
        [_registerButton setTitle:@"注册" forState:BtnNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_registerButton addTarget:self action:@selector(chooseRegister) forControlEvents:BtnTouchUpInside];
    }
    return _registerButton;
}

- (UIButton *)hadButton{
    if (!_hadButton) {
        _hadButton = [[UIButton alloc]initWithFrame:CGRectMake((__kWidth+AutoWidth(80))/4, CGRectYH(_registerButton)+AutoWidth(5), (__kWidth-80)/2, 20)];
        _hadButton.titleLabel.font = MFont(AutoWidth(15));
        [_hadButton setTitle:@"已有账号 ＞" forState:BtnNormal];
        [_hadButton setTitleColor:__DTextColor forState:BtnNormal];
        [_hadButton addTarget:self action:@selector(back) forControlEvents:BtnTouchUpInside];
    }
    return _hadButton;
}

#pragma mark ==注册==
- (void)chooseRegister{
    NSLog(@"注册");
}

#pragma mark ==LSLoginNaviViewDelegate==
- (void)naviBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ==LSLoginInputViewDelegate==
- (void)getTheinput:(NSString *)text index:(NSInteger)index{
    switch (index) {
        case 1:
        {
            NSLog(@"用户名");
        }
            break;
        case 2:
        {
            NSLog(@"手机");
        }
            break;
        case 3:
        {
            NSLog(@"密码");
        }
            break;
        case 4:
        {
            NSLog(@"确认密码");
        }
            break;
        case 5:
        {
            NSLog(@"请输入邮箱地址");
        }
            break;
        case 6:
        {
            NSLog(@"选填推荐码");
        }
            break;
        default:
            break;
    }
}

#pragma mark ==LSLoginSMSInputViewDelegate==
- (void)getSMSCode{
    NSLog(@"获取验证码");
}

- (void)getInputSMSCode:(NSString *)text{
    NSLog(@"%@",text);
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
