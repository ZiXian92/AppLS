//
//  ViewController.swift
//  AppLSTestApp
//
//  Created by Qua Zi Xian on 26/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import UIKit
import AppLSSwift

class ViewController: UIViewController {
    private let _dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initDir()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func initDir() {
        //Create dummy directory structure here
        let dir1 = _dir.stringByAppendingPathComponent("folder1")
        let dir2 = dir1.stringByAppendingPathComponent("folder2")
        let doc1 = _dir.stringByAppendingPathComponent("sample1.txt")
        let doc2 = dir1.stringByAppendingPathComponent("sample2.txt")
        
        "Contents of doc1".writeToFile(doc1, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        NSFileManager.defaultManager().createDirectoryAtPath(dir2, withIntermediateDirectories: true, attributes: nil, error: nil)
        "Contents of doc2".writeToFile(doc2, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
    }
    
    @IBAction func onTapLaunchButton(sender: UIButton) {
        let vc = AppLS.viewController
        presentViewController(vc, animated: true, completion: nil)
    }
    
    deinit {
        //Clean up dummy directory structure here
    }
}