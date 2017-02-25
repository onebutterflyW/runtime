//
//  People.h
//  runtime2
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
{
    NSString * _occupation;
    NSString * _nationlity;

}

@property (nonatomic,copy) NSString *name;
@property (nonatomic)      NSUInteger age;


-(NSDictionary *)allProperties;
-(NSDictionary *)allIvars;
-(NSDictionary *)allMetods;


@end
