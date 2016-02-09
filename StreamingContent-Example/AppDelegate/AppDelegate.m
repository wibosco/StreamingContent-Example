//
//  AppDelegate.m
//  StreamingContent-Example
//
//  Created by William Boles on 09/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "AppDelegate.h"

#import "SCEMPMoviePlayerViewController.h"
#import "SCEAVPlayerViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) SCEMPMoviePlayerViewController *mpPlayerViewController;
@property (nonatomic, strong) SCEAVPlayerViewController *avPlayerViewController;

@property (nonatomic, strong) UINavigationController *avPlayerNavigationController;
@property (nonatomic, strong) UINavigationController *mpPlayerNavigationController;

@end

@implementation AppDelegate

#pragma mark - AppLifeCycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*-------------------*/
    
    self.window.backgroundColor = [UIColor clearColor];
    self.window.clipsToBounds = NO;
    
    [self.window makeKeyAndVisible];
    
    /*-------------------*/
    
    return YES;
}

#pragma mark - Window

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.rootViewController = self.tabBarController;
    }
    
    return _window;
}

#pragma mark - Navigation

- (UITabBarController *)tabBarController
{
    if (!_tabBarController)
    {
        _tabBarController = [[UITabBarController alloc] init];
        
        [_tabBarController addChildViewController:self.mpPlayerNavigationController];
        [_tabBarController addChildViewController:self.avPlayerNavigationController];
    }
    
    return _tabBarController;
}

- (UINavigationController *)mpPlayerNavigationController
{
    if (!_mpPlayerNavigationController)
    {
        _mpPlayerNavigationController = [[UINavigationController alloc] initWithRootViewController:self.mpPlayerViewController];
    }
    
    return _mpPlayerNavigationController;
}

- (UINavigationController *)avPlayerNavigationController
{
    if (!_avPlayerNavigationController)
    {
        _avPlayerNavigationController = [[UINavigationController alloc] initWithRootViewController:self.avPlayerViewController];
    }
    
    return _avPlayerNavigationController;
}

#pragma mark - ViewControllers

- (SCEMPMoviePlayerViewController *)mpPlayerViewController
{
    if (!_mpPlayerViewController)
    {
        _mpPlayerViewController = [[SCEMPMoviePlayerViewController alloc] init];
        _mpPlayerViewController.title = @"MPMoviePlayer";
    }
    
    return _mpPlayerViewController;
}

- (SCEAVPlayerViewController *)avPlayerViewController
{
    if (!_avPlayerViewController)
    {
        _avPlayerViewController = [[SCEAVPlayerViewController alloc] init];
        _avPlayerViewController.title = @"AVPlayer";
    }
    
    return _avPlayerViewController;
}

@end
