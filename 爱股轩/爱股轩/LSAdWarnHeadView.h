//
//  LSAdWarnHeadView.h
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHeadImage.h"
#import "YWarnModel.h"

@protocol LSAdWarnHeadViewDelegate <NSObject>

- (void)chooseMore;

- (void)chooseWarnIndex:(NSInteger)index;

- (void)clickAdPicture:(NSString*)url;

@end

@interface LSAdWarnHeadView : UICollectionReusableView

@property (weak,nonatomic) id<LSAdWarnHeadViewDelegate>delegate;

@property (strong,nonatomic) NSArray <YWarnModel*>*titleArr;

@property (strong,nonatomic) NSArray <YHeadImage*>*imageArr;

@end
