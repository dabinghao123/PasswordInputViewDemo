//
//  ViewController.m
//  PasswordInputViewDemo
//
//  Created by yujianMac on 2019/9/30.
//  Copyright © 2019 yujianMac. All rights reserved.
//

#import "ViewController.h"
#import "PassWordInputAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *tanBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    tanBtn.frame = CGRectMake(0, 0, 100, 50);
    [tanBtn setTitle:@"显示" forState:UIControlStateNormal];
    [tanBtn addTarget:self action:@selector(showUIPasswordAction:) forControlEvents:UIControlEventTouchUpInside];
    tanBtn.center = self.view.center;
    [self.view addSubview:tanBtn];
    
    
}


- (void)showUIPasswordAction:(UIButton *)sender {
    
    PassWordInputAlertView *alerV= [PassWordInputAlertView PassWordInputAlertView:^(NSString * password) {
        NSLog(@"返回的密码password===%@",password);
    } loseSecretBlock:^{
        NSLog(@"忘记密码");
    }];
    
    [alerV showSuperV:self.view];
    
}


@end
