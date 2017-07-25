//
//  YAdHeadView.h
//  优胜办公
//
//  Created by imac on 2016/11/23.
//  Copyright © 2016年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"
#import "YHeadImage.h"

@protocol YAdHeadViewDelegate <NSObject>

-(void)chooseAD:(NSString *)url;

@end

@interface YAdHeadView : BaseView

@property (strong,nonatomic) NSArray<YHeadImage*> *dataArr;

@property (weak,nonatomic) id<YAdHeadViewDelegate>delegate;

@end
