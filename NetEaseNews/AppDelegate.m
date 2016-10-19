//
//  AppDelegate.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/19.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    //设置window属性，初始化windows的大小和位置
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //设置window的背景
    self.window.backgroundColor = [UIColor whiteColor];
    
    //初始化ViewController
    ViewController *mainController=[[ViewController alloc]init];
    mainController.isHiddenStatusBar = YES;
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:mainController];
    
    navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //设置此控制器为window的根控制器
    self.window.rootViewController = navigationController;
    
    //定义导航条的颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:210.0/255 green:40.0/255 blue:45.0/255 alpha:1]];
    
    
    CGFloat sysVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (sysVersion >= 8.0) {
        //当系统版本低于8.0时，下面代码会引起App Crash
        [[UINavigationBar appearance] setTranslucent:NO];
    }
    
    //定义导航条上文字的颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //设置导航的标题的颜色
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
    //设置window为应用程序主窗口并设为可见
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
