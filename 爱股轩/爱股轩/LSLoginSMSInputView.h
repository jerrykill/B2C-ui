//
//  LSLoginSMSInputView.h
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSLoginSMSInputViewDelegate <NSObject>

- (void)getSMSCode;

- (void)getInputSMSCode:(NSString *)text;

@end

@interface LSLoginSMSInputView : BaseView

@property (weak,nonatomic) id<LSLoginSMSInputViewDelegate>delegate;

@property (strong,nonatomic) NSString *placeholder;

@property (strong,nonatomic) NSString *imageName;

@property (assign,nonatomic) CGRect headFrame;

@end
