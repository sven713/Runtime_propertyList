//
//  Dog.m
//  Runtime_propertyList
//
//  Created by sve on 2018/6/15.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "Dog.h"
#import <objc/runtime.h>
@implementation Dog

-(void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i < count; i ++) {
        Ivar var = ivarList[i];
        const char *name = ivar_getName(var); //!!!!!!!!! ivar_getName
        NSString *pName  = [NSString stringWithUTF8String:name]; // 属性名
        
        id value = [self valueForKey:pName]; //KVC 取值
        NSLog(@"归档:%@--%@",pName, value);
        [aCoder encodeObject:value forKey:pName];
    }
    
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList(self.class, &count);
        
        for (int i = 0; i < count; i ++) {
            Ivar var = ivarList[i]; // 取出一个变量
            const char *name = ivar_getName(var); // 获取变量名
            NSString *ocName = [NSString stringWithUTF8String:name];
            
            id value = [aDecoder decodeObjectForKey:ocName]; // 解档取值
            [self setValue:value forKey:ocName]; //KVC 设置值
        }
        
    }
    return self;
}



@end
