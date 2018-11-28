//
//  ContactCell.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "ContactCell.h"

@implementation ContactCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 36, 36)];
    [self.contentView addSubview:self.headerImageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(86, 10, 50, 20)];
    [self.contentView addSubview:self.titleLabel];
    
    self.idLabel = [[UILabel alloc] initWithFrame:CGRectMake(86, 30, 100, 14)];
    self.idLabel.font = [UIFont systemFontOfSize:14];
    self.idLabel.tintColor = UIColor.grayColor;
    [self.contentView addSubview:self.idLabel];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 55, [UIScreen mainScreen].bounds.size.width, 1)];
    lineView.backgroundColor = UIColor.grayColor;
    [self.contentView addSubview:lineView];
    
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
