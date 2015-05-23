//
//  AppLS.m
//  AppLSObjC
//
//  Created by Qua Zi Xian on 27/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppLS.h"
#import "FileListViewController.h"

@implementation AppLS: NSObject

+(UINavigationController*)viewController {
    return [[UINavigationController alloc] initWithRootViewController:[[FileListViewController alloc] init]];
}

@end