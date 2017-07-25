//
//  LSClearanceTimeView.h
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHeadImage.h"

@protocol LSClearanceTimeViewDelegate <NSObject>

- (void)chooseTimeMore;

@end

@interface LSClearanceTimeView : UICollectionReusableView

@property (strong,nonatomic) NSString *time;

@property (weak,nonatomic) id<LSClearanceTimeViewDelegate>delegate;

@end
