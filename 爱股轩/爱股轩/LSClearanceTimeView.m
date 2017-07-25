//
//  LSClearanceTimeView.m
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSClearanceTimeView.h"

@interface LSClearanceTimeView ()

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) UIButton *hourBtn;

@property (strong,nonatomic) UIButton *minuteBtn;

@property (strong,nonatomic) UIButton *secondBtn;

@property (strong,nonatomic) UILabel *maoLabel;

@property (strong,nonatomic) UILabel *haoLabel;

@property (strong,nonatomic) UIButton *moreBtn;

@property (strong,nonatomic) NSTimer *timer;

@end

@implementation LSClearanceTimeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.logoIV];
    [self addSubview:self.hourBtn];
    [self addSubview:self.maoLabel];
    [self addSubview:self.minuteBtn];
    [self addSubview:self.haoLabel];
    [self addSubview:self.secondBtn];
    [self addSubview:self.moreBtn];
}

#pragma mark ==懒加载==
-(UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(14), AutoWidth(110), AutoWidth(20))];
        _logoIV.image =MImage(@"tlt_home_02");
        _logoIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _logoIV;
}

- (UIButton *)hourBtn{
    if (!_hourBtn) {
        _hourBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_logoIV)+AutoWidth(25), AutoWidth(10), 21, AutoWidth(25))];
        _hourBtn.layer.cornerRadius = 2;
        _hourBtn.backgroundColor = [UIColor whiteColor];
        _hourBtn.layer.borderColor = LH_RGBCOLOR(217, 217, 217).CGColor;
        _hourBtn.layer.borderWidth = 1;
        _hourBtn.titleLabel.font = MFont(AutoWidth(11));
        [_hourBtn setTitleColor:LH_RGBCOLOR(102, 102, 102) forState:BtnNormal];
        _hourBtn.userInteractionEnabled = NO;
    }
    return _hourBtn;
}

- (UILabel *)maoLabel{
    if (!_maoLabel) {
        _maoLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_hourBtn), AutoWidth(15), 9, AutoWidth(10))];
        _maoLabel.textColor = LH_RGBCOLOR(166, 166, 166);
        _maoLabel.font = MFont(AutoWidth(10));
        _maoLabel.textAlignment = NSTextAlignmentCenter;
        _maoLabel.text = @":";
    }
    return _maoLabel;
}

- (UIButton *)minuteBtn{
    if (!_minuteBtn) {
        _minuteBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_maoLabel), AutoWidth(10), 21, AutoWidth(25))];
        _minuteBtn.layer.cornerRadius = 2;
        _minuteBtn.backgroundColor = [UIColor whiteColor];
        _minuteBtn.layer.borderColor = LH_RGBCOLOR(217, 217, 217).CGColor;
        _minuteBtn.layer.borderWidth = 1;
        _minuteBtn.titleLabel.font = MFont(AutoWidth(11));
        [_minuteBtn setTitleColor:LH_RGBCOLOR(102, 102, 102) forState:BtnNormal];
        _minuteBtn.userInteractionEnabled = NO;
    }
    return _minuteBtn;
}

- (UILabel *)haoLabel{
    if (!_haoLabel) {
        _haoLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_minuteBtn), AutoWidth(15), 9, AutoWidth(10))];
        _haoLabel.textColor = LH_RGBCOLOR(166, 166, 166);
        _haoLabel.font = MFont(AutoWidth(10));
        _haoLabel.textAlignment = NSTextAlignmentCenter;
        _haoLabel.text = @":";
    }
    return _haoLabel;
}

- (UIButton *)secondBtn{
    if (!_secondBtn) {
        _secondBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_haoLabel), AutoWidth(10), 21, AutoWidth(25))];
        _secondBtn.layer.cornerRadius = 2;
        _secondBtn.backgroundColor = [UIColor whiteColor];
        _secondBtn.layer.borderColor = LH_RGBCOLOR(217, 217, 217).CGColor;
        _secondBtn.layer.borderWidth = 1;
        _secondBtn.titleLabel.font = MFont(AutoWidth(11));
        [_secondBtn setTitleColor:LH_RGBCOLOR(102, 102, 102) forState:BtnNormal];
        _secondBtn.userInteractionEnabled = NO;
    }
    return _secondBtn;
}

- (UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn= [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-65, AutoWidth(10), 60, AutoWidth(25))];
        _moreBtn.titleLabel.font = MFont(AutoWidth(15));
        [_moreBtn setTitle:@"更多＞" forState:BtnNormal];
        [_moreBtn setTitleColor:__LightTextColor forState:BtnNormal];
        [_moreBtn addTarget:self action:@selector(lookMore) forControlEvents:BtnTouchUpInside];
    }
    return _moreBtn;
}

- (void)lookMore{
    [self.delegate chooseTimeMore];
}

- (void)setTime:(NSString *)time{
    if (IsNilString(_time)) {
        _time =time;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduce) userInfo:nil repeats:YES];
    }
    NSString *hour = [NSString stringWithFormat:@"%ld",[_time integerValue]/3600];
    NSString *minute = [NSString stringWithFormat:@"%ld",[_time integerValue]%3600/60];
    NSString *second = [NSString stringWithFormat:@"%ld",[_time integerValue]%3600%60];
    [_hourBtn setTitle:hour forState:BtnNormal];
    [_minuteBtn setTitle:minute forState:BtnNormal];
    [_secondBtn setTitle:second forState:BtnNormal];


}

-(void)reduce{
    _time = [NSString stringWithFormat:@"%ld",[_time integerValue]-1];
    NSString *hour = [NSString stringWithFormat:@"%ld",[_time integerValue]/3600];
    NSString *minute = [NSString stringWithFormat:@"%ld",[_time integerValue]%3600/60];
    NSString *second = [NSString stringWithFormat:@"%ld",[_time integerValue]%3600%60];
    [_hourBtn setTitle:hour forState:BtnNormal];
    [_minuteBtn setTitle:minute forState:BtnNormal];
    [_secondBtn setTitle:second forState:BtnNormal];
}

-(void)dealloc{
    //取消定时器
    [_timer invalidate];
    _timer = nil;
}

@end
