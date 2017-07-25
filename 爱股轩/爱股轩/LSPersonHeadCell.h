//
//  LSPersonHeadCell.h
//  爱股轩
//
//  Created by imac on 2017/4/12.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSPersonHeadCellDelegate <NSObject>
/**消息中心*/
- (void)goinMessageCenter;
/**设置*/
- (void)lookSetting;
/**账户管理*/
- (void)userManager;

@end

@interface LSPersonHeadCell : UICollectionViewCell

@property (weak,nonatomic) id<LSPersonHeadCellDelegate>delegate;

@end
