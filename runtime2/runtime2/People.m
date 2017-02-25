//
//  People.m
//  runtime2
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "People.h"

#if  TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People


-(NSDictionary *)allProperties{

    unsigned int count = 0;
    
    //获取类的所有属性，如果没有属性count=0
   objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *result = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        const char *propertyName = property_getName(properties[i]);
        NSString *name   = [NSString stringWithUTF8String:propertyName];
        
        
        
        id propertyValue = [self valueForKey:name];
        
      
        
        
        if (propertyValue) {
            result[name] = propertyValue;
        } else {
            result[name] = @"字典的key对应的value不能为nil哦！";
        }
        
        
        
    }


    // 这里properties是一个数组指针，我们需要使用free函数来释放内存。
    free(properties);
    
    return result;

}


-(NSDictionary *)allIvars{
    
    unsigned int  count = 0;
    
    NSMutableDictionary *result = [@{} mutableCopy];
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        const char *varName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:varName];
        id varValue = [self valueForKey:name];
        
        if (varValue) {
            result[name]=varValue;
        }else{
            result[name]=@"字典的key对应的value不能为nil哦！";
        }
    }
    
        free(ivars);
        
        return result;
        
}
    
-(NSDictionary *)allMetods{

    unsigned int count = 0;
    
    NSMutableDictionary *result = [@{} mutableCopy];
    Method *methods = class_copyMethodList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        
        // 获取方法名称
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        
        // 获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        
        result[name] = @(arguments-2);
        
        
    }

    
    free(methods);
    
    return result;

}


@end
