//
//  LSAnnouncementView.h
//  优胜办公
//
//  Created by imac on 2017/3/31.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"
#import "YWarnModel.h"


@protocol LSAnnouncementViewDelegate <NSObject>

- (void)getMore;

- (void)chooseWarn:(NSInteger)index;

@end

@interface LSAnnouncementView : BaseView

@property (strong,nonatomic) NSArray<YWarnModel*>*titleArr;

@property (weak,nonatomic) id<LSAnnouncementViewDelegate>delegate;

@end
