/* Copyright (c) 2012 Dropbox, Inc. All rights reserved. */

#import <dropbox/Dropbox.h>
#import <UIKit/UIKit.h>

@interface FolderListController : UITableViewController

- (id)initWithFilesystem:(DBFilesystem *)filesystem root:(DBPath *)root;

@property (nonatomic, readonly) DBAccount *account;

@end
