//
//  TWHomeViewController.m
//  RollEggs
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWHomeViewController.h"
#import "TWGameViewController.h"

@interface TWHomeViewController ()

@end

@implementation TWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bgImageView];
    [self initEggs];
    [self initTitleView];
    [self startButton];
}

- (void)initEggs{
    // 背景鸡蛋
}

- (void)initTitleView{
    // 标题
    
}

- (void)startButton{
    UIButton * start = [UIButton buttonWithType:UIButtonTypeCustom];
    [start setImage:[UIImage imageNamed:@"twbeginBtn"] forState:UIControlStateNormal];
    [start sizeToFit];
    start.center = self.view.center;
    [self.view addSubview:start];
    [start addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)startButtonClick{
    TWGameViewController * game = [[TWGameViewController alloc]init];
    [self presentViewController:game animated:YES completion:nil];
}

- (void)bgImageView{
    UIImageView * bg = [[UIImageView alloc]initWithFrame:self.view.frame];
    bg.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:bg];
}

@end
