//
//  LSTeacherRecommondSectionView.h
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTeacherRecommendHeadView.h"
#import "LSTeacherCourseTypeChooseView.h"

@protocol LSTeacherRecommondSectionViewDelegate <NSObject>

- (void)chooseCourseType:(NSInteger)sender;

@end

@interface LSTeacherRecommondSectionView : UICollectionReusableView

@property (strong,nonatomic) LSTeacherModel *model;

@property (weak,nonatomic) id<LSTeacherRecommondSectionViewDelegate>delegate;

@end
