//
//  People.h
//  runtime4
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic, copy) NSString *name;//姓名
@property (nonatomic, strong) NSNumber *age;//年龄
@property (nonatomic, copy) NSString *occupation;//职业
@property (nonatomic, copy) NSString *nationality;//国籍


//生成model
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

//转换成字典
-(NSDictionary *)covertToDictionary;

@end
