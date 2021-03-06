//
//  LSTeacherCourseTypeChooseView.h
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSTeacherCourseTypeChooseViewDelegate <NSObject>

- (void)chooseCourse:(NSInteger)sender;

@end

@interface LSTeacherCourseTypeChooseView : BaseView

@property (weak,nonatomic) id<LSTeacherCourseTypeChooseViewDelegate>delegate;

@end
