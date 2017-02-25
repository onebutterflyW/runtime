//
//  main.m
//  runtime4
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
        NSDictionary *dic = @{
                              @"name":@"李老师",
                              @"age":@18,
                              @"occuoation":@"老师",
                              @"nationality":@"中国"
                              };
        //字典转模型
        People *Teacher = [[People alloc]initWithDictionary:dic];
         NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",Teacher.nationality,Teacher.age,Teacher.name,Teacher.occupation);
        
        //模型转字典
        NSDictionary *covertDic = [Teacher covertToDictionary];
        NSLog(@"%@",covertDic);
        
        
        
        
    }
    return 0;
}
