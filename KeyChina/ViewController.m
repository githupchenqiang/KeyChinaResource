//
//  ViewController.m
//  KeyChina
//
//  Created by QAING CHEN on 17/1/17.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import "ViewController.h"
#import "UUID.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *UUIDstring = [UUID getUUID];
    NSLog(@"%@",UUIDstring);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
