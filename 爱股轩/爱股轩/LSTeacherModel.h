//
//  LSTeacherModel.h
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTeacherModel : NSObject
/**教师id*/
@property (strong,nonatomic) NSString *teacherId;
/**教师名字*/
@property (strong,nonatomic) NSString *teacherName;
/**教师归属名*/
@property (strong,nonatomic) NSString *logoName;
/**简介*/
@property (strong,nonatomic) NSString *introduceInfo;
/**头像*/
@property (strong,nonatomic) NSString *teacherUrl;


@end
