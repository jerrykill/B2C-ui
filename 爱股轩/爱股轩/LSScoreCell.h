//
//  LSScoreCell.h
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSScoreCellDelegate <NSObject>

- (void)integralChooseAction:(NSInteger)index;

@end

@interface LSScoreCell : UICollectionViewCell

@property (weak,nonatomic) id<LSScoreCellDelegate>delegate;

@end
