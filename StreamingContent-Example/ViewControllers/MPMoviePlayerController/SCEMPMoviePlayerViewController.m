//
//  ViewController.m
//  StreamingContent-Example
//
//  Created by William Boles on 09/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "SCEMPMoviePlayerViewController.h"

#import <MediaPlayer/MediaPlayer.h>

@interface SCEMPMoviePlayerViewController ()

@property (nonatomic, strong) MPMoviePlayerController *streamPlayer;

@end

@implementation SCEMPMoviePlayerViewController

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
    
    [self.streamPlayer play];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    /*-----------------*/
    
    [self.streamPlayer pause];
}

#pragma mark - Player

- (MPMoviePlayerController *)streamPlayer
{
    if (!_streamPlayer)
    {
        //example video from http://stackoverflow.com/questions/10104301/hls-streaming-video-url-need-for-testing
        NSURL *streamURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
        
        _streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
        _streamPlayer.controlStyle = MPMovieControlStyleEmbedded;
        _streamPlayer.view.frame = CGRectMake(0.0f,
                                              0.0f,
                                              self.view.frame.size.width,
                                              self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height);
    }
    
    return _streamPlayer;
}

@end
