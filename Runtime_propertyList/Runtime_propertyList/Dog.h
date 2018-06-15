//
//  Dog.h
//  Runtime_propertyList
//
//  Created by sve on 2018/6/15.
//  Copyright © 2018年 sve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject<NSCoding>
@property (nonatomic, copy) NSString *dogName;
@property (nonatomic, assign) NSInteger dogAge;
@end
