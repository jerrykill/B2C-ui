//
//  LSThirdBindingViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/14.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSThirdBindingViewController.h"
#import "LSLoginNaviView.h"
#import "LSLoginInputView.h"
#import "LSRegisterViewController.h"

@interface LSThirdBindingViewController ()<LSLoginNaviViewDelegate,LSLoginInputViewDelegate>

@property (strong,nonatomic) LSLoginNaviView *naviV;

@property (strong,nonatomic) LSLoginInputView *phoneInputV;

@property (strong,nonatomic) LSLoginInputView *passwordInputV;

@property (strong,nonatomic) UIButton *loginButton;

@property (strong,nonatomic) UIButton *registerButton;

@property (strong,nonatomic) UIButton *forgetButton;

@end

@implementation LSThirdBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.naviV];
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.phoneInputV];
    [self.view addSubview:self.passwordInputV];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.forgetButton];
}

#pragma mark ==懒加载==
- (LSLoginNaviView *)naviV{
    if (!_naviV) {
        _naviV = [[LSLoginNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.title = @"爱股轩登录绑定";
        _naviV.delegate = self;
    }
    return _naviV;
}

- (LSLoginInputView *)phoneInputV {
    if (!_phoneInputV) {
        _phoneInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_naviV)+AutoWidth(50), __kWidth, AutoWidth(70))];
        _phoneInputV.tag = 1;
        _phoneInputV.placeholder = @"邮箱/用户名/已验证手机";
        _phoneInputV.imageName = @"user_icon_login";
        _phoneInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(15), AutoWidth(22), AutoWidth(28));
        _phoneInputV.delegate = self;
    }
    return _phoneInputV;
}

- (LSLoginInputView *)passwordInputV {
    if (!_passwordInputV) {
        _passwordInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_phoneInputV), __kWidth, AutoWidth(70))];
        _passwordInputV.tag = 2;
        _passwordInputV.imageName = @"password_icon_login";
        _passwordInputV.placeholder = @"请输入密码...";
        _passwordInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(16), AutoWidth(22), AutoWidth(26));
        _passwordInputV.delegate = self;
    }
    return _passwordInputV;
}
- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(30), CGRectYH(_passwordInputV)+AutoWidth(10), AutoWidth(315), AutoWidth(54))];
        _loginButton.layer.cornerRadius = AutoWidth(27);
        _loginButton.gradientColor = @"yes";
        _loginButton.titleLabel.font = BFont(AutoWidth(19));
        [_loginButton setTitle:@"登录" forState:BtnNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_loginButton addTarget:self action:@selector(chooseLogin) forControlEvents:BtnTouchUpInside];
    }
    return _loginButton;
}


- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(30), CGRectYH(_loginButton)+AutoWidth(15), AutoWidth(315), AutoWidth(54))];
        _registerButton.backgroundColor = [UIColor whiteColor];
        _registerButton.layer.cornerRadius = AutoWidth(28);
        _registerButton.titleLabel.font = MFont(AutoWidth(16));
        _registerButton.layer.borderColor = __BackColor.CGColor;
        _registerButton.layer.borderWidth = 1;
        NSMutableAttributedString *strs = [[NSMutableAttributedString alloc]initWithString:@"还没有账号？快速注册"];
        [strs addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(6, 4)];
        [_registerButton setAttributedTitle:strs forState:BtnNormal];
        [_registerButton addTarget:self action:@selector(chooseLogon) forControlEvents:BtnTouchUpInside];
    }
    return _registerButton;
}

- (UIButton *)forgetButton {
    if (!_forgetButton) {
        _forgetButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(110), CGRectYH(_registerButton)+AutoWidth(55), AutoWidth(90), AutoWidth(30))];
        _forgetButton.titleLabel.font = MFont(AutoWidth(15));
        NSMutableAttributedString *titles = [[NSMutableAttributedString alloc]initWithString:@"忘记密码？"];
        [titles addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(0, titles.length)];
        [_forgetButton setAttributedTitle:titles forState:BtnNormal];
        [_forgetButton setTitleColor:__DTextColor forState:BtnNormal];
        [_forgetButton addTarget:self action:@selector(chooseForget) forControlEvents:BtnTouchUpInside];
    }
    return _forgetButton;
}

#pragma mark ==LSLoginNaviViewDelegate==
- (void)naviBack{
    [self back];
}

#pragma mark ==LSLoginInputViewDelegate==
- (void)getTheinput:(NSString *)text index:(NSInteger)index{
    switch (index) {
        case 1:
        {
            NSLog(@"手机号");
        }
            break;
        case 2:
        {
            NSLog(@"密码");
        }
            break;
        default:
            break;
    }
}


#pragma mark ==登录==
- (void)chooseLogin{
    NSLog(@"登录");
}

#pragma mark ==注册==
- (void)chooseLogon {
    NSLog(@"注册");
    LSRegisterViewController *vc = [[LSRegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ==忘记密码==
- (void)chooseForget {
    NSLog(@"忘记密码");
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
