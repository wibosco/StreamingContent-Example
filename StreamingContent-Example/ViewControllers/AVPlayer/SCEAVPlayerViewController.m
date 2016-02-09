//
//  SCEAVPlayerViewController.m
//  StreamingContent-Example
//
//  Created by William Boles on 09/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "SCEAVPlayerViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface SCEAVPlayerViewController ()

@property (nonatomic, strong) AVPlayer *streamPlayer;
@property (nonatomic, strong) AVPlayerLayer *streamPlayerLayer;

@end

@implementation SCEAVPlayerViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*-----------------*/
    
    [self.view.layer addSublayer:self.streamPlayerLayer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /*-----------------*/
    
    [self.streamPlayer play];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    /*-----------------*/
    
    [self.streamPlayer pause];
}

#pragma mark - Player

- (AVPlayer *)streamPlayer
{
    if (!_streamPlayer)
    {
        NSURL *streamURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
        
        _streamPlayer = [AVPlayer playerWithURL:streamURL];
    }
    
    return _streamPlayer;
}

#pragma mark - Layer

- (AVPlayerLayer *)streamPlayerLayer
{
    if (!_streamPlayerLayer)
    {
        _streamPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.streamPlayer];
        
        _streamPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        _streamPlayerLayer.frame = CGRectMake(0.0f,
                                               0.0f,
                                               self.view.frame.size.width,
                                               self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height);
    }
    
    return _streamPlayerLayer;
}

@end
