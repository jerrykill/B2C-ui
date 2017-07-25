//
//  LSPersonWalletCell.h
//  爱股轩
//
//  Created by imac on 2017/4/12.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSPersonWalletCellDelegate <NSObject>

- (void)lookUseMoney;

- (void)lookStockMoney;

- (void)lookIntegral;

@end

@interface LSPersonWalletCell : UICollectionViewCell

@property (weak,nonatomic) id<LSPersonWalletCellDelegate>delegate;

@end
