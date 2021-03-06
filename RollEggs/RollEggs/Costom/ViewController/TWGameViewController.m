//
//  TWGameViewController.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/29.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWGameViewController.h"
#import "TWEge.h"
#import "TWBan.h"
#import "Score.h"
#import "TWOverViewController.h"

@interface TWGameViewController ()<TWEgeDelegate, TWBanDelegate>
@property (nonatomic, strong) UIImageView * dangbanView;
@property (nonatomic, assign) BOOL move;
@property (nonatomic, assign) BOOL paused;
@property (nonatomic, strong) UILabel * scoreLabel;
@property (nonatomic, strong) Score * score;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) NSTimer * accelerateTimer;
@property (nonatomic, assign) CGFloat time;
@end

@implementation TWGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _move = YES;
    _paused = NO;
    _time = 2.0;
    _score = [Score initScore];
    [self bgImageView];
    [self dangbanImageView];
    [self initScoreLabel];
    _timer = [NSTimer scheduledTimerWithTimeInterval:_time target:self selector:@selector(createEge) userInfo:nil repeats:YES];
    _accelerateTimer = [NSTimer scheduledTimerWithTimeInterval:60 repeats:YES block:^(NSTimer * _Nonnull timer) {
        _time-=0.1;
        if (_time < 0.5) {
            _time = 0.5;
        }
    }];
    [self initDismissButton];
}

- (void)initDismissButton{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 20, 44, 44);
    [button setImage:[UIImage imageNamed:@"tw_tipsRemove"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismissButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)dismissButtonClick{
    _paused = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    [_accelerateTimer invalidate];
    _accelerateTimer = nil;
    [_timer invalidate];
    _timer = nil;
}

- (void)initScoreLabel{
    _scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, TWScreenWidth, 100)];
    _scoreLabel.text = [NSString stringWithFormat:@"%d",_score.points];
    _scoreLabel.textAlignment = NSTextAlignmentCenter;
    _scoreLabel.textColor = [UIColor whiteColor];
    _scoreLabel.font = [UIFont fontWithName:@"Chalkduster" size:100];
    [self.view addSubview:_scoreLabel];
}

- (void)createEge{
    if (!_paused) {
        NSInteger index = arc4random() % 12;
        CGFloat height = One * 141 / 34.0;
        TWEge * ege = [[TWEge alloc]initWithFrame:CGRectMake(index * One, -height, One, height)];
        [ege startMoveing];
        ege.delegate = self;
        [self.view addSubview:ege];
    }
}

- (void)gameoverNoti{
    _paused = YES;
    TWOverViewController * over = [[TWOverViewController alloc]init];
    over.score = _score.points / 7;
    over.block = ^{
        _paused = NO;
        _score.points = 0;
        _scoreLabel.text = @"0";
    };
    [self presentViewController:over animated:YES completion:nil];
}

- (void)checkPosition:(TWEge *)ball{
    for (TWBan * ban in _dangbanView.subviews) {
        if ([ban checkIfCaught:ball.frame]) {
            ball.caught = YES;
            break;
        } else {
            // 没有碰到，就加分
            [_score addPoints];
        }
        // 显示分数
        _scoreLabel.text = [NSString stringWithFormat:@"%d",(_score.points / 7)];
    }
}

- (void)removeMe:(TWEge *)ball{
    [ball removeFromSuperview];
}

- (BOOL)checkGameStatus{
    return _paused;
}

- (void)bgImageView{
    UIImageView * bg = [[UIImageView alloc]initWithFrame:self.view.frame];
    bg.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:bg];
}

- (void)dangbanImageView{
    CGFloat width = TWScreenWidth + One;
    CGFloat height = width * 16 / 520.0;
    _dangbanView = [[UIImageView alloc]initWithFrame:CGRectMake(0, DangbanY, width, height)];
    _dangbanView.image = [UIImage imageNamed:@"dangban"];
    [self.view addSubview:_dangbanView];
    
    // 添加小的版块
    for (NSInteger i = 0; i < 7; i++) {
        TWBan * small = [[TWBan alloc]initWithFrame:CGRectMake(i * One * 2, 0, One, height)];
        small.delegate = self;
        [_dangbanView addSubview:small];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_move) {
        _dangbanView.tw_x = -One;
        for (NSInteger i = 0; i < 7; i++) {
            TWBan * ban = (TWBan *)_dangbanView.subviews[i];
            ban.x = -One + i * One * 2;
        }
        _move = NO;
    } else {
        _dangbanView.tw_x = 0;
        for (NSInteger i = 0; i < 7; i++) {
            TWBan * ban = (TWBan *)_dangbanView.subviews[i];
            ban.x = i * One * 2;
        }
        _move = YES;
    }
}

@end
