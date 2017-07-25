//
//  LSLoginViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSLoginViewController.h"
#import "LSLoginNaviView.h"
#import "LSLoginInputView.h"
#import "YshareChooseView.h"

#import "LSSMSLoginViewController.h"
#import "LSRegisterViewController.h"
#import "LSFoundPasswordViewController.h"

@interface LSLoginViewController ()<LSLoginNaviViewDelegate,LSLoginInputViewDelegate,YshareChooseViewDelegate>

@property (strong,nonatomic) LSLoginNaviView *naviV;

@property (strong,nonatomic) UIScrollView *backV;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) LSLoginInputView *nameInputV;

@property (strong,nonatomic) LSLoginInputView *passwordInputV;

@property (strong,nonatomic) UIButton *loginButton;

@property (strong,nonatomic) UIButton *cannotButton;

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) UIButton *logonbutton;

@property (strong,nonatomic) YshareChooseView *shareV;

@property (strong,nonatomic) NSString *name;

@property (strong,nonatomic) NSString *password;

@end

@implementation LSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.naviV];
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.backV];
    [_backV addSubview:self.logoIV];
    [_backV addSubview:self.nameInputV];
    [_backV addSubview:self.passwordInputV];
    [_backV addSubview:self.loginButton];
    [_backV addSubview:self.cannotButton];
    [_backV addSubview:self.lineIV];
    [_backV addSubview:self.logonbutton];
    [_backV addSubview:self.shareV];
}

#pragma mark ==懒加载==
- (LSLoginNaviView *)naviV{
    if (!_naviV) {
        _naviV = [[LSLoginNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.delegate = self;
        _naviV.title = @"爱股轩登陆";
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

- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(170))/2, AutoWidth(31), AutoWidth(170), AutoWidth(48))];
        _logoIV.image = MImage(@"logo_login");
        _logoIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _logoIV;
}

- (LSLoginInputView *)nameInputV{
    if (!_nameInputV) {
        _nameInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_logoIV)+AutoWidth(30), __kWidth, AutoWidth(70))];
        _nameInputV.tag = 1;
        _nameInputV.imageName = @"user_icon_login";
        _nameInputV.placeholder = @"邮箱/用户名/已验证手机";
        _nameInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(15), AutoWidth(22), AutoWidth(28));
        _nameInputV.delegate = self;
    }
    return _nameInputV;
}

- (LSLoginInputView *)passwordInputV{
    if (!_passwordInputV) {
        _passwordInputV = [[LSLoginInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_nameInputV), __kWidth, AutoWidth(70))];
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

- (UIButton *)cannotButton{
    if (!_cannotButton) {
        _cannotButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(20), CGRectYH(_loginButton)+AutoWidth(30), (__kWidth-AutoWidth(80))/2, AutoWidth(20))];
        _cannotButton.titleLabel.font = MFont(AutoWidth(15));
        [_cannotButton setTitle:@"无法登陆？" forState:BtnNormal];
        [_cannotButton setTitleColor:__TextColor forState:BtnNormal];
        [_cannotButton addTarget:self action:@selector(cannotLogin) forControlEvents:BtnTouchUpInside];
    }
    return _cannotButton;
}

- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(__kWidth/2-AutoWidth(1), CGRectYH(_loginButton)+AutoWidth(35), 2, AutoWidth(14))];
        _lineIV.backgroundColor = LH_RGBCOLOR(200, 200, 200);
    }
    return _lineIV;
}

- (UIButton *)logonbutton{
    if (!_logonbutton) {
        _logonbutton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth/2+AutoWidth(20), CGRectYH(_loginButton)+AutoWidth(30), (__kWidth-AutoWidth(80))/2, AutoWidth(20))];
        _logonbutton.titleLabel.font = MFont(AutoWidth(15));
        [_logonbutton setTitle:@"现在注册＞" forState:BtnNormal];
        [_logonbutton setTitleColor:__DefaultColor forState:BtnNormal];
        [_logonbutton addTarget:self action:@selector(logon) forControlEvents:BtnTouchUpInside];
    }
    return _logonbutton;
}

- (YshareChooseView *)shareV{
    if (!_shareV) {
        _shareV = [[YshareChooseView alloc]initWithFrame:CGRectMake(0, CGRectYH(_logonbutton)+AutoWidth(100), __kWidth, AutoWidth(110))];
        _shareV.delegate = self;
    }
    return _shareV;
}

#pragma mark ==LSLoginNaviViewDelegate==
- (void)naviBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ==LSLoginInputViewDelegate==
- (void)getTheinput:(NSString *)text index:(NSInteger)index{
    if (index==1) {
        _name = text;
    }else{
        _password = text;
    }
}


#pragma mark ==登录==
- (void)chooseLogin{
    NSLog(@"登录");
}
#pragma mark ==无法登陆==
- (void)cannotLogin{
    NSLog(@"无法登陆");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"短信验证登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"短信登录");
        LSSMSLoginViewController *vc = [[LSSMSLoginViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"找回密码" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"找回密码");
        LSFoundPasswordViewController *vc = [[LSFoundPasswordViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark ==注册==
- (void)logon{
    NSLog(@"注册");
    LSRegisterViewController *vc = [[LSRegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ==YshareChooseViewDelegate==
- (void)chooseShare:(NSInteger)sender{
    NSArray *list = @[@"qq",@"微信",@"微博"];
    NSLog(@"%@",list[sender]);
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
