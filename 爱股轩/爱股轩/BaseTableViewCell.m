//
//  BaseTableViewCell.m
//  shopSN
//
//  Created by imac on 15/12/2.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=HEXCOLOR(0xffffff);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    while ([self.contentView.subviews lastObject] != nil)
    {
        [(UIView*)[self.contentView.subviews lastObject] removeFromSuperview];
    }

}



@end
