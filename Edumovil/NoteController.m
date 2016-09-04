/* Copyright (c) 2012 Dropbox, Inc. All rights reserved. */

#import "NoteController.h"


@interface NoteController () <UITextViewDelegate>

@property (nonatomic, retain) DBFile *file;

@end


@implementation NoteController

- (id)initWithFile:(DBFile *)file {
	if (!(self = [super init])) return nil;
	_file = file;
	self.navigationItem.title = [_file.info.path name];
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    NSData *data = [_file readData:nil];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:webView];
    [webView loadData:data MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:nil];
    
    [webView.scrollView setUserInteractionEnabled:YES];
    [webView setScalesPageToFit:YES];

    
}

@end
