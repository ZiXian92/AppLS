//
//  FileListViewController.swift
//  AppLS-Swift
//
//  The table view controller resposible for listing files and folders in the given directory.
//
//  Created by Qua Zi Xian on 26/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import Foundation
import UIKit

class FileListViewController: UITableViewController {
    private let numSections = 1
    private let cellIdentifier = "fileListCell"
    private let _dir: String
    private var _contents: [Descriptor]!
    
    init() {
        _dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "rightButtonClicked:")
        _contents = getContents()
        title = _dir.lastPathComponent
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    init(directory: String) {
        _dir = directory
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "rightButtonClicked:")
        _contents = getContents()
        title = _dir.lastPathComponent
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UITableViewDelegate methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        if row >= 0 && row < _contents.count {
            if _contents[row].isDir {
                navigationController?.pushViewController(FileListViewController(directory: _dir.stringByAppendingPathComponent(_contents[row].name)), animated: true)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            } else {
                if let destinationVC = FileDescriptorViewController(filePath: _dir.stringByAppendingPathComponent(_contents[row].name)) {
                    navigationController?.pushViewController(destinationVC, animated: true)
                }
                tableView.deselectRowAtIndexPath(indexPath, animated: false)
            }
        }
    }
    //End of UITableViewDelegate methods
    
    //UITableViewDataSource methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numSections
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _contents.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = _contents[indexPath.row].name
        if _contents[indexPath.row].isDir {
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        }
        return cell
    }
    //End of UITableViewDataSource methods
    
    private func getContents() -> [Descriptor] {
        var isDir: ObjCBool = false
        let fileList = NSFileManager.defaultManager().contentsOfDirectoryAtPath(_dir, error: nil) as! [String]
        var arr = [Descriptor]()
        arr.reserveCapacity(fileList.count)
        
        //Create appropriate descriptor for each item in directory.
        for file in fileList {
            NSFileManager.defaultManager().fileExistsAtPath(_dir.stringByAppendingPathComponent(file), isDirectory: &isDir)
            arr.append(Descriptor(name: file, isDir: Bool(isDir)))
        }
        
        return arr
    }
    
    /// Dismisses the app on tapping right bar button.
    func rightButtonClicked(sender: UIBarButtonItem) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}