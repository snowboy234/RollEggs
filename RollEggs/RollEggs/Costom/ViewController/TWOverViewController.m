//
//  TWOverViewController.m
//  RollEggs
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWOverViewController.h"

@interface TWOverViewController ()
@property (weak, nonatomic) IBOutlet UILabel *gameoverLabel;
@property (weak, nonatomic) IBOutlet UILabel *bencidengfenLabel;
@property (weak, nonatomic) IBOutlet UILabel *benciScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxSorceLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;

@end

@implementation TWOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _gameoverLabel.text = NSLocalizedString(@"Over", nil);
    _gameoverLabel.shadowColor = [UIColor darkGrayColor];
    _gameoverLabel.shadowOffset = CGSizeMake(5, 5);
    _bencidengfenLabel.text = NSLocalizedString(@"This", nil);
    _benciScoreLabel.font = [UIFont fontWithName:@"Chalkduster" size:20];
    _benciScoreLabel.text = [NSString stringWithFormat:@"%ld",_score];
    _maxSorceLabel.text = NSLocalizedString(@"Max", nil);
    _maxLabel.font = [UIFont fontWithName:@"Chalkduster" size:20];
    NSInteger maxS = [[NSUserDefaults standardUserDefaults] integerForKey:MaxScore];
    _maxLabel.text = [NSString stringWithFormat:@"%ld",maxS];
    if (maxS < _score) {
        [[NSUserDefaults standardUserDefaults] setInteger:_score forKey:MaxScore];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (IBAction)restartButtonClick:(id)sender {
    if (_block) {
        _block();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
