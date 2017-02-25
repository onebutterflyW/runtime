//
//  People+Associated.h
//  runtime2
//
//  Created by 软件工程系01 on 17/2/25.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "People.h"

typedef void(^CodingCallBack)();


@interface People (Associated)

@property (nonatomic, strong) NSNumber *associatedGrade;//成绩
@property (nonatomic, copy) CodingCallBack associatedCallBack;


@end
