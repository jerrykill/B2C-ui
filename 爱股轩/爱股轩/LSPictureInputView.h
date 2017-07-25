//
//  LSPictureInputView.h
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSPictureInputViewDelegate <NSObject>

- (void)getThePictureCode:(NSString *)sender;

- (void)changeNextPic;

@end

@interface LSPictureInputView : BaseView

@property (weak,nonatomic) id<LSPictureInputViewDelegate>delegate;

@end
