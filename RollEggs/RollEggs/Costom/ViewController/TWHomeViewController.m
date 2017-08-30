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
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@end

@implementation TWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.text = NSLocalizedString(@"Title", nil);
    _titleLabel.shadowColor = [UIColor darkGrayColor];
    _titleLabel.shadowOffset = CGSizeMake(5, 5);
    _tipLabel.text = NSLocalizedString(@"Tip", nil);
}

- (IBAction)startButtonClick:(id)sender {
    TWGameViewController * game = [[TWGameViewController alloc]init];
    [self presentViewController:game animated:YES completion:nil];
}

@end
