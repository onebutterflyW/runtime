//
//  People+Associated.m
//  runtime2
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "People+Associated.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People (Associated)

-(void)setAssociatedGrade:(NSNumber *)grade{

    //设置关联对象
    objc_setAssociatedObject(self, @selector(associatedGrade),grade , OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(NSNumber *)associatedGrade{

    return objc_getAssociatedObject(self, @selector(associatedGrade));


}



-(void)setAssociatedCallBack:(CodingCallBack)callback{

    objc_setAssociatedObject(self, @selector(associatedCallBack), callback, OBJC_ASSOCIATION_COPY_NONATOMIC);

}
-(CodingCallBack)associatedCallBack{

    return objc_getAssociatedObject(self, @selector(associatedCallBack));

}


@end
