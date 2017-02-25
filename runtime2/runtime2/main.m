//
//  main.m
//  runtime2
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
#import "People+Associated.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        People *teacher = [[People alloc]init];
        teacher.name = @"李老师";
        teacher.age  = 18;
        [teacher setValue:@"老师" forKey:@"occupation"];
        teacher.associatedGrade = @(90);
        teacher.associatedCallBack = ^(){
        
            NSLog(@"老师要写代码！");
        
        };
        
        teacher.associatedCallBack();
        
        
        NSDictionary *propertyResultDic = [teacher allProperties];
        for (NSString *propertyName in propertyResultDic.allValues) {
            
             NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertyResultDic[propertyName]);
            
        }
        
        
        
        NSDictionary *methodResultDic = [teacher allMetods];
        for (NSString *methodName in methodResultDic.allKeys) {
              NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
        }
        
        
    }
    return 0;
}
