//
//  CKYSExcellentCourseContentCollectionCell.m
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSExcellentCourseContentCollectionCell.h"

CGFloat CKYS_EC_CONTENT_CELL_HEIGHT = 150;

CGFloat CKYS_EC_CONTENT_CELL_WIDTH = 173;

CGFloat CKYS_EC_CONTENT_CELL_MARGIN = 10;

@implementation CKYSExcellentCourseContentCollectionCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor grayColor];
    }
    return self;
}

@end
