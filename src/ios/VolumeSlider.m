//
//  	VolumeSlider.m
//  	Volume Slider PhoneGap Plugin
//
//  	Created by Tommy-Carlos Williams on 20/07/25.
//  	Copyright 2011 Tommy-Carlos Williams. All rights reserved.
//      MIT Licensed
//

#import "VolumeSlider.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation VolumeSlider

@synthesize mpVolumeViewParentView, myVolumeView, callbackId;

#ifndef __IPHONE_3_0
@synthesize webView;
#endif

-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
{
    self = (VolumeSlider*)[super initWithWebView:theWebView];
    return self;
}

- (void)dealloc
{	
	[mpVolumeViewParentView release];
	[myVolumeView release];
    [super dealloc];
}


#pragma mark -
#pragma mark VolumeSlider

- (void)createVolumeSlider:(CDVInvokedUrlCommand*)command
{		
	CGFloat originx = [[command.arguments objectAtIndex:0] floatValue];
	CGFloat originy = [[command.arguments objectAtIndex:1] floatValue];
	CGFloat width = [[command.arguments objectAtIndex:2] floatValue];
	CGFloat height = [[command.arguments objectAtIndex:3] floatValue];
	
	CGRect viewRect = CGRectMake(
								 originx, 
								 originy, 
								 width, 
								 height
								 );
	self.mpVolumeViewParentView = [[[UIView alloc] initWithFrame:viewRect] autorelease];
	[self.webView.superview addSubview:mpVolumeViewParentView];
	
	mpVolumeViewParentView.backgroundColor = [UIColor clearColor];
	self.myVolumeView =
	[[MPVolumeView alloc] initWithFrame: mpVolumeViewParentView.bounds];
	[mpVolumeViewParentView addSubview: myVolumeView];
	self.myVolumeView.showsVolumeSlider = NO;
}

- (void)showVolumeSlider:(CDVInvokedUrlCommand*)command
{
	self.myVolumeView.showsVolumeSlider = YES;
	self.mpVolumeViewParentView.hidden = NO;
}

- (void)hideVolumeSlider:(CDVInvokedUrlCommand*)command
{
	self.mpVolumeViewParentView.hidden = YES;
	self.myVolumeView.showsVolumeSlider = NO;
}



@end

