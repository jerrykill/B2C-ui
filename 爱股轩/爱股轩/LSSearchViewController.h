//
//  LSSearchViewController.h
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseViewController.h"



@interface LSSearchViewController : BaseViewController

@property (strong,nonatomic) YPopView *popV;

@property (assign,nonatomic) BOOL searchEdit;

@property (strong,nonatomic) NSString *searchText;

@end
