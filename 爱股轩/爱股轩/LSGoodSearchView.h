//
//  LSGoodSearchView.h
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSGoodSearchViewDelegate <NSObject>

@optional

- (void)goodSearch:(NSString *)sender;

- (void)startEdit;

@end

@interface LSGoodSearchView : BaseView

@property (weak,nonatomic) id<LSGoodSearchViewDelegate>delegate;

@property (assign,nonatomic) BOOL isEdit;

@property (strong,nonatomic) NSString *searchText;

@end
