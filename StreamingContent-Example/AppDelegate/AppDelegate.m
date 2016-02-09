//
//  AppDelegate.m
//  StreamingContent-Example
//
//  Created by William Boles on 09/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "AppDelegate.h"

#import "SCEMPMoviePlayerViewController.h"
#import "SCEAVPlayerViewControllerViewController.h"
#import "SCEAVPlayerViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) SCEMPMoviePlayerViewController *mpPlayerViewController;
@property (nonatomic, strong) SCEAVPlayerViewControllerViewController *avPlayerViewControllerViewController;
@property (nonatomic, strong) SCEAVPlayerViewController *avPlayerViewController;

@property (nonatomic, strong) UINavigationController *avPlayerViewControllerNavigationController;
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
        [_tabBarController addChildViewController:self.avPlayerViewControllerNavigationController];
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

- (UINavigationController *)avPlayerViewControllerNavigationController
{
    if (!_avPlayerViewControllerNavigationController)
    {
        _avPlayerViewControllerNavigationController = [[UINavigationController alloc] initWithRootViewController:self.avPlayerViewControllerViewController];
    }
    
    return _avPlayerViewControllerNavigationController;
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
        _mpPlayerViewController.title = @"MPMoviePlayerController";
    }
    
    return _mpPlayerViewController;
}

- (SCEAVPlayerViewControllerViewController *)avPlayerViewControllerViewController
{
    if (!_avPlayerViewControllerViewController)
    {
        _avPlayerViewControllerViewController = [[SCEAVPlayerViewControllerViewController alloc] init];
        _avPlayerViewControllerViewController.title = @"AVPlayerViewController";
    }
    
    return _avPlayerViewControllerViewController;
}

- (SCEAVPlayerViewControllerViewController *)avPlayerViewController
{
    if (!_avPlayerViewController)
    {
        _avPlayerViewController = [[SCEAVPlayerViewController alloc] init];
        _avPlayerViewController.title = @"AVPlayer";
    }
    
    return _avPlayerViewController;
}

@end
