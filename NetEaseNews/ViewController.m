//
//  ViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/19.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "ViewController.h"
#import "SplashView.h"


@interface ViewController ()

@property (nonatomic, retain) SplashView *splashView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navbar_netease"]];
    self.navigationItem.titleView = titleImageView;
    
    _splashView = [[[NSBundle mainBundle] loadNibNamed:@"SplashView" owner:self options:nil] firstObject];
    _splashView.frame = self.view.bounds;
    _splashView.showTime = 2.5f;  //启动广告展示时间
    
    [[[UIApplication sharedApplication]keyWindow]addSubview:_splashView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((_splashView.showTime - 0.3) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _isHiddenStatusBar = NO;
        [self setNeedsStatusBarAppearanceUpdate];
    });
    
    [UIView animateWithDuration:0.2 delay:_splashView.showTime options:UIViewAnimationOptionCurveEaseOut animations:^{
        _splashView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [_splashView removeAndCleanUp];
        [_splashView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return _isHiddenStatusBar;
}

@end
