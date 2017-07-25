//
//  LSGoodSearchNaviView.h
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSGoodSearchNaviViewDelegate <NSObject>

- (void)goodNameSeach:(NSString*)sender;

- (void)chooseBack;

@end

@interface LSGoodSearchNaviView : BaseView

@property (weak,nonatomic) id<LSGoodSearchNaviViewDelegate>delegate;

@end
