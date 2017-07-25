//
//  LSLoginNaviView.h
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSLoginNaviViewDelegate <NSObject>

- (void)naviBack;

@end

@interface LSLoginNaviView : BaseView

@property (strong,nonatomic) NSString *title;

@property (strong,nonatomic) NSString *cancel;

@property (weak,nonatomic) id<LSLoginNaviViewDelegate>delegate;

@end
