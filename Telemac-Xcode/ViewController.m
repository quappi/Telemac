//
//  ViewController.m
//  Telemac-Xcode
//
//  Created by Frederik Riedel on 22.05.16.
//  Copyright © 2016 Quappi. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString* indexURL = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    
    NSURL* url = [NSURL URLWithString:indexURL];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [[self.webView mainFrame] loadRequest:request];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterFullScreenMode) name:@"NSWindowWillEnterFullScreenNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitFullScreenMode) name:@"NSWindowWillExitFullScreenNotification" object:nil];
    
    // Do any additional setup after loading the view.
}

-(void) enterFullScreenMode {
    [self.webView stringByEvaluatingJavaScriptFromString:@"player.pause();"];
}

-(void) exitFullScreenMode {
    [self.webView stringByEvaluatingJavaScriptFromString:@"player.play();"];
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
