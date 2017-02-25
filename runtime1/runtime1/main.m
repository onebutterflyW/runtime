//
//  main.m
//  runtime1
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import<objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

void sayFunction(id self,SEL _cmd,id some){

    NSLog(@"%@岁的%@说：%@",object_getIvar(self,class_getInstanceVariable([self class],"_age")),[self valueForKey:@"name"],some);

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//使用objc——allocateClassPair()创建一个类，然后用class_addIvar添加成员变量，然后class_addMethoid添加一个方法
        //动态创建一个Person类，继承NSObject
        Class People = objc_allocateClassPair([NSObject class], "Person", 0);
        
        //为Person添加NSString *name和int age的成员变量
        class_addIvar(People, "_name", sizeof(NSString *), log2(sizeof(NSString*)), @encode(NSString*));
        class_addIvar(People, "_age", sizeof(int), log2(sizeof(int)), @encode(int));
        
        //向Person类中添加一个say的方法
        SEL s = sel_registerName("say:");//注册方法名为say的方法
        class_addMethod(People, s , (IMP)sayFunction, "v@:@");//添加名为say方法
        
        //注册该类
        objc_registerClassPair(People);
        
        
//获取成员变量并且给起赋值
        id PepoleInstance = [[People alloc]init];
        [PepoleInstance setValue:@"小明" forKey:@"name"];//KVC获取name
        
        //从类中获取类的实例变量
        Ivar ageIvar  = class_getInstanceVariable(People, "_age");
        Ivar nameIvar = class_getInstanceVariable(People, "_name");
        
        
        //为实例变量ageIvar赋值
        object_setIvar(PepoleInstance, ageIvar, @18);
        object_setIvar(PepoleInstance, nameIvar, @"小红");
        
        //调用say方法问好
        ((void (*)(id,SEL,id))objc_msgSend)(PepoleInstance,s ,@"大家好");
        PepoleInstance = nil;
        
        
        //销毁类
        objc_disposeClassPair(People);
        
        
        
        
    }
    return 0;
}
