//
//  FileListViewController.m
//  AppLSObjC
//
//  Created by Qua Zi Xian on 27/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FileListViewController.h"

// Defines an item in a directory.
// name represents the item name.
// isDir indicates it the item is a directory.
@interface Descriptor : NSObject 

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) BOOL *isDir;

-(id)init:(NSString*)name isDir:(BOOL*)isDir;

@end

@implementation Descriptor: NSObject

-(id)init:(NSString*)name isDir:(BOOL*)isDir {
    if(self = [super init]) {
        _name = name;
        _isDir = isDir;
        return self;
    } else {
        return nil;
    }
}

@end

@implementation FileListViewController: UITableViewController

int _numSections = 1;
NSString *_cellIdentifier = @"fileListCell";
NSString *_dir;
NSArray *_contents;

-(id)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        _dir = (NSString*)[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) objectAtIndex:(NSUInteger)0];
        _contents = [self getContents];
        self.title = [_dir lastPathComponent];
        [self navigationItem].rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(rightBarButtonClicked:)];
        [[self tableView] registerClass:[UITableViewCell class] forCellReuseIdentifier:_cellIdentifier];
        [self tableView].dataSource = self;
        [self tableView].delegate = self;
        return self;
    } else {
        return nil;
    }
}

-(id)initForDirectory:(NSString *)directory {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        _dir = directory;
        return self;
    } else {
        return nil;
    }
}

// UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _numSections;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_contents count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[self tableView] dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = [_contents objectAtIndex:[indexPath row]];
    return cell;
}
//End of UITableViewDataSource methods

// Dismisses the app when Cancel button is tapped.
-(void)rightBarButtonClicked:(UIBarButtonItem*)sender {
    [[self navigationController] dismissViewControllerAnimated:true completion:nil];
}

// Gets list of files and folders in the given directory.
-(NSArray*)getContents {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSArray *fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_dir error:nil];
    
    // Construct the respective descriptor for each item
    for (NSString *file in fileList) {
        BOOL *isDir;
        [[NSFileManager defaultManager] fileExistsAtPath:[_dir stringByAppendingPathComponent:file] isDirectory:isDir];
        [arr addObject:[[Descriptor alloc] init:file isDir:isDir]];
    }
    return arr;
}

@end