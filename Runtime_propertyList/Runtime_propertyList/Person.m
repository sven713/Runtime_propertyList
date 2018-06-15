//
//  Person.m
//  Runtime_propertyList
//
//  Created by sve on 2018/6/15.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}


- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}

@end
