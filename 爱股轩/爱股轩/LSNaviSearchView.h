//
//  LSNaviSearchView.h
//  优胜办公
//
//  Created by imac on 2017/3/31.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSNaviSearchViewDelegate <NSObject>

- (void)startSearch;

@end

@interface LSNaviSearchView : BaseView

@property (weak,nonatomic) id<LSNaviSearchViewDelegate>delegate;

@end
