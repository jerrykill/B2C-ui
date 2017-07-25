//
//  LSPersonHeadCell.m
//  爱股轩
//
//  Created by imac on 2017/4/12.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSPersonHeadCell.h"

@interface LSPersonHeadCell ()

@property (strong,nonatomic) UIImageView *backIV;
/**标题栏*/
@property (strong,nonatomic) UILabel *titleLabel;
/**消息按钮*/
@property (strong,nonatomic) UIButton *messageButton;
/**设置*/
@property (strong,nonatomic) UIButton *settingButton;
/**头像*/
@property (strong,nonatomic) UIImageView *headIV;
/**账户管理*/
@property (strong,nonatomic) UIButton *manageButton;
/**用户名*/
@property (strong,nonatomic) UILabel *nameLabel;
/**等级图标*/
@property (strong,nonatomic) UIImageView *levelIV;

@end

@implementation LSPersonHeadCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.backIV];
    [self sendSubviewToBack:_backIV];

    [self addSubview:self.titleLabel];
    [self addSubview:self.messageButton];
    [self addSubview:self.settingButton];
    [self addSubview:self.headIV];
    [self addSubview:self.manageButton];
    [self addSubview:self.nameLabel];
    [self addSubview:self.levelIV];
}

#pragma mark ==懒加载==
- (UIImageView *)backIV{
    if (!_backIV) {
        _backIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kWidth/2)];
        _backIV.image = MImage(@"我的_bg");
        _backIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backIV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((__kWidth-120)/2, 34, 120, 20)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = BFont(18);
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"我的爱股轩";
    }
    return _titleLabel;
}

- (UIButton *)messageButton{
    if (!_messageButton) {
        _messageButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-35, 31, 25, 25)];
        [_messageButton setImage:MImage(@"news_Cart") forState:BtnNormal];
        [_messageButton addTarget:self action:@selector(lookMessage) forControlEvents:BtnTouchUpInside];
    }
    return _messageButton;
}

- (UIButton *)settingButton{
    if (!_settingButton) {
        _settingButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(50), AutoWidth(92.5), AutoWidth(30), AutoWidth(30))];
        [_settingButton setImage:MImage(@"my_site") forState:BtnNormal];
        [_settingButton addTarget:self action:@selector(chooseSetting) forControlEvents:BtnTouchUpInside];
    }
    return _settingButton;
}

- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(90))/2, AutoWidth(65), AutoWidth(90), AutoWidth(90))];
        _headIV.layer.cornerRadius =AutoWidth(45);
        _headIV.layer.borderColor = LH_RGBCOLOR(244, 150, 130).CGColor;
        _headIV.layer.borderWidth = AutoWidth(2.5);
        _headIV.image = MImage(@"head-portrait_mine");
        _headIV.clipsToBounds = YES;
        _headIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headIV;
}

- (UIButton *)manageButton{
    if (!_manageButton) {
        _manageButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(85), AutoWidth(92.5), AutoWidth(100), AutoWidth(30))];
        _manageButton.layer.cornerRadius = 15;
        _manageButton.backgroundColor = [UIColor whiteColor];
        [_manageButton setTitle:@"账户管理" forState:BtnNormal];
        [_manageButton setTitleColor:LH_RGBCOLOR(115, 115, 115) forState:BtnNormal];
        [_manageButton setImage:MImage(@"Account_ico") forState:BtnNormal];
        _manageButton.titleLabel.font = MFont(AutoWidth(14));
        _manageButton.titleEdgeInsets = UIEdgeInsetsMake(0, -AutoWidth(7), 0, 0);
        _manageButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, AutoWidth(60));
        [_manageButton addTarget:self action:@selector(chooseManage) forControlEvents:BtnTouchUpInside];
    }
    return _manageButton;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectYH(_headIV)+AutoWidth(5), __kWidth/2-AutoWidth(10), AutoWidth(15))];
        _nameLabel.textAlignment = NSTextAlignmentRight;
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = MFont(AutoWidth(13));
        _nameLabel.text = @"会员昵称";
    }
    return _nameLabel;
}

- (UIImageView *)levelIV{
    if (!_levelIV) {
        _levelIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectXW(_nameLabel)+AutoWidth(5), CGRectYH(_headIV)+AutoWidth(5), AutoWidth(78), AutoWidth(16))];
        _levelIV.image = MImage(@"member");
        _levelIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _levelIV;
}

#pragma mark ==查看消息==
- (void)lookMessage{
    [self.delegate goinMessageCenter];
}
#pragma mark ==设置==
- (void)chooseSetting{
    [self.delegate lookSetting];
}
#pragma mark ==管理==
- (void)chooseManage{
    [self.delegate userManager];
}


@end


