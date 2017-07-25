//
//  LSChangeCountView.h
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSChangeCountViewDelegate <NSObject>

- (void)changeCount:(BOOL)sender;

@end

@interface LSChangeCountView : BaseView

@property (strong,nonatomic) NSString *count;

@property (weak,nonatomic) id<LSChangeCountViewDelegate>delegate;

@end
