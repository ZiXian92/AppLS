//
//  ViewController.m
//  AppLSTestApp
//
//  Created by Qua Zi Xian on 29/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

#import "ViewController.h"
#import "AppLS.h"

@implementation ViewController: UIViewController

NSString *_dir;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) objectAtIndex:0];
    [self initDir];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapLaunchButton:(UIButton *)sender {
    UINavigationController *vc = [AppLS viewController];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)initDir {
    NSString *dir1 = [_dir stringByAppendingPathComponent:@"folder1"];
    NSString *dir2 = [dir1 stringByAppendingPathComponent:@"folder2"];
    NSString *doc1 = [_dir stringByAppendingPathComponent:@"sampleText1.txt"];
    NSString *doc2 = [dir1 stringByAppendingPathComponent:@"sampleText2.txt"];
    NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
    [attr setValue:@"AppLS" forKey:NSFileOwnerAccountName];
    
    [@"Contents of doc1." writeToFile:doc1 atomically:true encoding:NSUTF8StringEncoding error:nil];
    [[NSFileManager defaultManager] createDirectoryAtPath:dir2 withIntermediateDirectories:true attributes:attr error:nil];
    [@"Hello." writeToFile:doc2 atomically:true encoding:NSUTF8StringEncoding error:nil];
}

@end
