//
//  Person.h
//  Runtime_propertyList
//
//  Created by sve on 2018/6/15.
//  Copyright © 2018年 sve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age; //!<年龄
@end
