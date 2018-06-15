//
//  ViewController.m
//  Runtime_propertyList
//
//  Created by sve on 2018/6/15.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"路径-%@",NSTemporaryDirectory());
    
    
}

- (IBAction)saveBtnClikc:(id)sender {
    
    Person *p = [[Person alloc] init];
    p.name = @"宋锡铭";
    p.age = 29;
    
//    NSString *path = NSTemporaryDirectory();
//    NSString *filePath = [path stringByAppendingPathComponent:@"sven.plist"];
    
    [NSKeyedArchiver archiveRootObject:p toFile:[self filePath]];
    
}

- (NSString *)filePath {
    NSString *path = NSTemporaryDirectory();
    NSString *filePath = [path stringByAppendingPathComponent:@"sven.plist"];
    return filePath;
}


- (IBAction)readBtnClick:(id)sender {
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    NSLog(@"解档结果:%@--%zd",p.name, p.age);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Person *p = [[Person alloc] init];
}

@end
