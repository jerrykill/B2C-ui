//
//  LSBaseViewController.h
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseViewController.h"

@interface LSBaseViewController : BaseViewController

@property (strong,nonatomic) UIButton *leftNaviButton;

@property (strong,nonatomic) UIButton *rightNaviButton;

@property (strong,nonatomic) UIView *headNaviV;

@property (strong,nonatomic) YPopView *popV;

@property (strong,nonatomic) NSString *naviTitle;

@end
