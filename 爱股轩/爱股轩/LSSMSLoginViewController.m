//
//  LSSMSLoginViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSSMSLoginViewController.h"
#import "LSLoginNaviView.h"
#import "LSLoginInputView.h"
#import "YshareChooseView.h"
#import "LSLoginSMSInputView.h"

#import "LSRegisterViewController.h"

@interface LSSMSLoginViewController ()<LSLoginNaviViewDelegate,LSLoginInputViewDelegate,YshareChooseViewDelegate,LSLoginSMSInputViewDelegate>

@property (strong,nonatomic) LSLoginNaviView *naviV;

@property (strong,nonatomic) UIScrollView *backV;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) LSLoginInputView *nameInputV;

@property (strong,nonatomic) LSLoginSMSInputView *codeInputV;

@property (strong,nonatomic) UIButton *loginButton;

@property (strong,nonatomic) UIButton *cannotButton;

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) UIButton *logonbutton;

@property (strong,nonatomic) YshareChooseView *shareV;

@property (strong,nonatomic) NSString *name;

@property (strong,nonatomic) NSString *password;

@end

@implementation LSSMSLoginViewController

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
    [_backV addSubview:self.codeInputV];
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
        _naviV.title = @"爱股轩短信登陆";
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
        _nameInputV.imageName = @"iPhone_icon_login";
        _nameInputV.placeholder = @"请输入验证手机...";
        _nameInputV.headFrame = CGRectMake(AutoWidth(19), AutoWidth(16), AutoWidth(18), AutoWidth(25));
        _nameInputV.delegate = self;
    }
    return _nameInputV;
}

- (LSLoginSMSInputView *)codeInputV{
    if (!_codeInputV) {
        _codeInputV = [[LSLoginSMSInputView alloc]initWithFrame:CGRectMake(0, CGRectYH(_nameInputV), __kWidth, AutoWidth(70))];
        _codeInputV.imageName = @"sms_icon_login";
        _codeInputV.headFrame = CGRectMake(AutoWidth(17), AutoWidth(20), AutoWidth(21), AutoWidth(17));
        _codeInputV.delegate = self;
    }
    return _codeInputV;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(30), CGRectYH(_codeInputV)+AutoWidth(10), AutoWidth(315), AutoWidth(54))];
        _loginButton.layer.cornerRadius = AutoWidth(27);
        _loginButton.gradientColor = @"yes";
        _loginButton.titleLabel.font = BFont(19);
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
        [_cannotButton setTitle:@"账户登录" forState:BtnNormal];
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
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ==LSLoginInputViewDelegate==
- (void)getTheinput:(NSString *)text index:(NSInteger)index{
    _name = text;
}

#pragma mark ==LSLoginSMSInputViewDelegate==
- (void)getSMSCode{
    NSLog(@"获取验证码");
}

- (void)getInputSMSCode:(NSString *)text{
    NSLog(@"%@",text);
}


#pragma mark ==登录==
- (void)chooseLogin{
    NSLog(@"登录");
}
#pragma mark ==账户登陆==
- (void)cannotLogin{
    [self.navigationController popViewControllerAnimated:YES];
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
