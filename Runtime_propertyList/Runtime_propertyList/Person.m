//
//  Person.m
//  Runtime_propertyList
//
//  Created by sve on 2018/6/15.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>


//struct objc_ivar {
//    char * _Nullable ivar_name                               OBJC2_UNAVAILABLE;
//    char * _Nullable ivar_type                               OBJC2_UNAVAILABLE;
//    int ivar_offset                                          OBJC2_UNAVAILABLE;
//#ifdef __LP64__
//    int space                                                OBJC2_UNAVAILABLE;
//#endif
//}

@implementation Person

//-(instancetype)init {
//    if (self = [super init]) {
//        unsigned int count = 0;
//        Ivar *ivars = class_copyIvarList([Person class], &count); // 属性列表
//        for (int i = 0; i < count; i ++) {
//
//            //--------------------------------
//            Ivar var = ivars[i];
//            const char *name = ivar_getName(var); // 变量名
//            //--------------------------------
//
//            NSLog(@"%s",name);
//
//            NSString *ocName = [NSString stringWithUTF8String:name];
//            id value = [self valueForKey:ocName]; // kvc获取值
//
//
//        }
//    }
//    return self;
//}

-(void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeInteger:self.age forKey:@"age"];
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Person class], &count); // 属性列表
    for (int i = 0; i < count; i ++) {
        
        //--------------------------------
        Ivar var = ivars[i];
        const char *name = ivar_getName(var); // 变量名
        //--------------------------------
        
        NSString *ocName = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:ocName]; // kvc获取值
        [aCoder encodeObject:value forKey:ocName];
    }
    
    free(ivars);
}


- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"_name"];
//        self.age = [aDecoder decodeIntegerForKey:@"_age"];
        
        
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([Person class], &count); // 属性列表
        for (int i = 0; i < count; i ++) {
            
            //--------------------------------
            Ivar var = ivars[i];
            const char *name = ivar_getName(var); // 变量名
            //--------------------------------
            
            NSString *ocName = [NSString stringWithUTF8String:name];
            id result = [aDecoder decodeObjectForKey:ocName];
            
            [self setValue:result forKey:ocName]; //KVC设置值
        }
        
        free(ivars);
    }
    return self;
}

@end
