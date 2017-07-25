//
//  LSCourseCell.h
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSCourseCellDelegate <NSObject>

- (void)chooseCoureseView:(NSInteger)index;

@end

@interface LSCourseCell : UICollectionViewCell

@property (weak,nonatomic) id<LSCourseCellDelegate>delegate;

@end
