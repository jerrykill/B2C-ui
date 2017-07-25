//
//  LSLoginInputView.h
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSLoginInputViewDelegate <NSObject>

- (void)getTheinput:(NSString*)text index:(NSInteger)index;

@end

@interface LSLoginInputView : BaseView

@property (weak,nonatomic) id<LSLoginInputViewDelegate>delegate;

@property (strong,nonatomic) NSString *placeholder;

@property (assign,nonatomic) CGRect headFrame;

@property (strong,nonatomic) NSString *imageName;

@end
