//
//  FirstViewController.m
//  XibReuseableViewDemo
//
//  Created by Travel Chu on 16/1/8.
//  Copyright © 2016年 TravelChu. All rights reserved.
//

#import "FirstViewController.h"
#import "CardView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CardView *cardView = [[CardView alloc] initWithFrame:CGRectMake(10.0, 70.0, 300.0, 186.0)];
    [self.view addSubview:cardView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
