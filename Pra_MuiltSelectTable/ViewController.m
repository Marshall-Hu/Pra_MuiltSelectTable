//
//  ViewController.m
//  Pra_MuiltSelectTable
//
//  Created by StarSky_MacBook Pro on 2019/6/9.
//  Copyright © 2019 StarSky_MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"asdasda");
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];//隐藏navigationBar下边的横线
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];//设置透明背景

}


@end
