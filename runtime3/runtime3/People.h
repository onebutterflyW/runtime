//
//  People.h
//  runtime3
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong)NSNumber *age;
@property (nonatomic, copy) NSString *occupation;//职业
@property (nonatomic, copy) NSString *nationlity;//国籍

@end
