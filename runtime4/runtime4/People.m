//
//  People.m
//  runtime4
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "People.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@implementation People

//字典转模型
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{

    self = [super init];
    if (self) {
        
        for (NSString *key in dictionary.allKeys) {
            id value = dictionary[key];
            
            SEL  setter = [self propertySetterByKey:key];
            if (setter) {
                ((void (*)(id, SEL, id))objc_msgSend)(self, setter, value);
            }
        }
    }
    return  self;
}


//模型转字典
-(NSDictionary *)covertToDictionary{

    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    if (count != 0 ) {
        
        NSMutableDictionary *result = [@{} mutableCopy];
        
        for (NSUInteger i = 0; i < count; i ++) {
            const void *propertyName = property_getName(properties[i]);
            NSString *name = [NSString stringWithUTF8String:propertyName];
            
            SEL getter = [self propertyGetterBykey:name];
            if (getter) {
               id value = ((id (*)(id, SEL))objc_msgSend)(self, getter);
               if(value){
                   result[name] = value;
               }else{
                   result[name] = @"字典的key对应的value不能为nil哦！";
               }
                
            }
        }
        free(properties);
        
        return result;
    }

    free(properties);
    
    return nil;


}


#pragma mark - private method

//生成setter方法
-(SEL)propertySetterByKey:(NSString *)key{

    //设置方法的setS...大写
    NSString *propertySetterName = [NSString stringWithFormat:@"set%@:",key.capitalizedString];
    
    SEL setter = NSSelectorFromString(propertySetterName);
    if ([self respondsToSelector:setter]) {
        return setter;
    }
    
    return nil;

}


//生成getter方法

-(SEL)propertyGetterBykey:(NSString *)key{

    SEL getter = NSSelectorFromString(key);
    if ([self respondsToSelector:getter]) {
        return getter;
    }
    return nil;

}


@end
