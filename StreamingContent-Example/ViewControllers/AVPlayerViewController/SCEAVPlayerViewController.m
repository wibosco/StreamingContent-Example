//
//  SCEAVPlayerViewController.m
//  StreamingContent-Example
//
//  Created by William Boles on 09/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "SCEAVPlayerViewController.h"

#import <AVKit/AVPlayerViewController.h>
#import <AVFoundation/AVFoundation.h>

@interface SCEAVPlayerViewController ()

@property (nonatomic, strong) AVPlayerViewController *playerViewController;

@end

@implementation SCEAVPlayerViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*-----------------*/
    
    [self.view addSubview:self.streamPlayer.view];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /*-----------------*/
    
    [self.playerViewController.player play];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    /*-----------------*/
    
    [self.playerViewController.player pause];
}

#pragma mark - Player

- (AVPlayerViewController *)playerViewController
{
    if (!_playerViewController)
    {
        NSURL *streamURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
        
        _playerViewController = [[AVPlayerViewController alloc] init];
        
        _playerViewController.player = [AVPlayer playerWithURL:streamURL];
        
        _playerViewController.showsPlaybackControls = YES;
        _streamPlayer.view.frame = CGRectMake(0.0f,
                                              0.0f,
                                              self.view.frame.size.width,
                                              self.view.frame.size.height - 150.0f);
    }
    
    return _playerViewController;
}


@end
