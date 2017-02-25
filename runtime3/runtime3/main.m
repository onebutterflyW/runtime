//
//  main.m
//  runtime3
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "People.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        People *Teacher = [[People alloc] init];
        Teacher.name = @"李老师";
        Teacher.age = @18;
        Teacher.occupation = @"老师";
        Teacher.nationlity = @"日本";
        
        NSString *path = NSHomeDirectory();
        path = [NSString stringWithFormat:@"%@/lilaoshi",path];
        
        //归档
        [NSKeyedArchiver archiveRootObject:Teacher toFile:path];
        
        //解档
        People *teacher = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",teacher.nationlity,teacher.age,teacher.name,teacher.occupation);
        
    }
    return 0;
}
