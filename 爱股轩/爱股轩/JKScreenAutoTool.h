//
//  JKScreenAutoTool.h
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"


static inline CGFloat AutoWidth(CGFloat width){
    return width*__kWidth/375;
}

@interface JKScreenAutoTool : BaseView

@end
