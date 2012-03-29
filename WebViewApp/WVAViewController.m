//
//  WVAViewController.m
//  WebViewApp
//
//  Created by Mac on 29.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WVAViewController.h"
#import "SBJson.h"

@implementation WVAViewController
@synthesize WebVewCon;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSString *getFriendDialogs = [NSString stringWithFormat:@"https://api.vk.com/method/messages.getHistory?access_token=993a0fd190cc7ef390cc7ef3b290e708db990cc90cd6ef152bdb57fb9ecbdb0&uid=26356841&chat_id=uid&count=10"];
    NSURL *url = [NSURL URLWithString:getFriendDialogs];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    NSData *tempContainer = [NSURLConnection sendSynchronousRequest:requestObj returningResponse:nil error:nil];
    
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    
   NSDictionary *dialogDictionary = [jsonParser objectWithData:tempContainer];
    
    NSArray *jsonItems = [NSArray arrayWithObject:dialogDictionary];
    
    
    for (int ind = 0; ind > jsonItems.count; ind++)
    {
       
        //NSDictionary *stream = (NSDictionary *)[dialogDictionary objectEnumerator];
        NSLog(@"Some body: %@",[[jsonItems objectAtIndex:ind] objectForKey:@"body"]);
    }
   
    
    
    [WebVewCon loadRequest:requestObj];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setWebVewCon:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
