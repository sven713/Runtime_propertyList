//
//  DogViewController.m
//  Runtime_propertyList
//
//  Created by sve on 2018/6/15.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "DogViewController.h"
#import "Dog.h"

@interface DogViewController ()

@end

@implementation DogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI {
    UIButton *saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    saveBtn.backgroundColor = [UIColor orangeColor];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
    UIButton *readBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    readBtn.backgroundColor = [UIColor orangeColor];
    [readBtn setTitle:@"读取" forState:UIControlStateNormal];
    [readBtn addTarget:self action:@selector(readBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readBtn];
}

- (NSString *)dogFilePath {
    NSString *temp = NSTemporaryDirectory();
    return [temp stringByAppendingPathComponent:@"dog.plist"];
}

- (void)saveBtnClick {
    Dog *d = [[Dog alloc] init];
    d.dogName = @"哈士奇";
    d.dogAge = 8;
    
    [NSKeyedArchiver archiveRootObject:d toFile:[self dogFilePath]];
}

- (void)readBtnClick {
    Dog *d = [NSKeyedUnarchiver unarchiveObjectWithFile:[self dogFilePath]];
    NSLog(@"解档成功-狗 %@--%zd",d.dogName, d.dogAge);
}

@end
