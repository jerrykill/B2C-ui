//
//  LSBaseSearchNaviView.h
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSBaseSearchNaviViewDelegate <NSObject>

- (void)backAction;

- (void)rightAction;

@optional

- (void)startSearch;

- (void)searchAction:(NSString*)sender;

@end

@interface LSBaseSearchNaviView : BaseView

@property (assign,nonatomic) BOOL isEdit;

@property (strong,nonatomic) NSString *searchText;

@property (weak,nonatomic) id<LSBaseSearchNaviViewDelegate>delegate;

@end
