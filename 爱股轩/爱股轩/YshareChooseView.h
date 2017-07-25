//
//  YshareChooseView.h
//  优胜办公
//
//  Created by imac on 2016/12/5.
//  Copyright © 2016年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol YshareChooseViewDelegate <NSObject>

-(void)chooseShare:(NSInteger)sender;

@end

@interface YshareChooseView : BaseView

@property (weak,nonatomic) id<YshareChooseViewDelegate>delegate;

@end
