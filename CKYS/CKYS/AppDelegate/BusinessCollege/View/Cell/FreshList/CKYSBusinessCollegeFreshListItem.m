//
//  CKYSBusinessCollegeFreshListItem.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeFreshListItem.h"


@interface CKYSBusinessCollegeFreshListItem ()

@property(nonatomic, strong) NSString *image;

@property(nonatomic, strong) NSString *title;

@property(nonatomic, assign) int index;

@end

@implementation CKYSBusinessCollegeFreshListItem

- (NSString *)description {

    return [NSString stringWithFormat:@"\nimage:%@ \ntitle:%@ \nindex:%d ",self.image,self.title,self.index];
}

@end
