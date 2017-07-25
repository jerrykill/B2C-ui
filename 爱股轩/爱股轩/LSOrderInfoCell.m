//
//  LSOrderInfoCell.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSOrderInfoCell.h"

@interface LSOrderInfoCell ()<UITextViewDelegate>

@property (strong,nonatomic) UITextView *inputTV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *placholerLabel;

@end

@implementation LSOrderInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{

}

#pragma mark ==懒加载==
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(13), __kWidth-AutoWidth(20), AutoWidth(15))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = MFont(AutoWidth(14));
        _titleLabel.textColor=__TextColor;
        _titleLabel.text = @"给商家留言：";
    }
    return _titleLabel;
}

- (UITextView *)inputTV {
    if (!_inputTV) {
        _inputTV = [[UITextView alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(10), __kWidth-AutoWidth(20), AutoWidth(15))];
        _inputTV.backgroundColor = __BackColor;
        _inputTV.layer.cornerRadius = AutoWidth(4);

    }
    return _inputTV;
}


//- (UITextView *)inputTV {
//    if (!_inputTV) {
//        _inputTV = [[UITextView alloc]init];
//    }
//    return _inputTV;
//}


@end
