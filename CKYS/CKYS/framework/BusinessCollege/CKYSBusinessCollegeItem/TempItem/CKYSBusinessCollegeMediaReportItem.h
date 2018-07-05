//
//  CKYSBusinessCollegeMediaReportItem.h
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKYSBusinessCollegeMediaReportItem : NSObject <NSCopying, NSMutableCopying>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *typecode;
@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *urlshare;

@end
