//
//  FileDescriptor.swift
//  AppLS-Swift
//
//  The table view controller responsible for displaying attributes of the given file's descriptor.
//
//  Created by Qua Zi Xian on 27/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import Foundation
import UIKit

class FileDescriptorViewController: UITableViewController {
    private let _cellIdentifier = "descriptorCell"
    private let _numSections = 1
    private let _keys = ["", NSFileType, NSFileSize, NSFileOwnerAccountName, NSFileCreationDate, NSFileModificationDate]
    private let _attributes = ["Name", "Type", "Size(Bytes)", "Owner", "Date Created", "Last Modified"]
    private let _info: NSDictionary
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Creates a table view controller instance with the file descriptor's attributes for the given file.
    ///
    /// :param: filePath The full path to the file whose descriptor is to be displayed.
    /// :returns: Table view controller with contents of the given file's descriptor. Returns nil if filePath represents a non-existent file or an error occurred.
    init?(filePath: String) {
        //Checks for potential failure due to invalid file path
        if let descriptor = NSFileManager.defaultManager().attributesOfItemAtPath(filePath, error: nil) {
            _info = descriptor
            super.init(nibName: nil, bundle: nil)
        } else {
            _info = NSDictionary()
            super.init(nibName: nil, bundle: nil)
            return nil
        }
        
        title = filePath.lastPathComponent
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "rightButtonClicked:")
        tableView.userInteractionEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(FileDescriptorCell.self, forCellReuseIdentifier: _cellIdentifier)
    }
    
    //UITableViewDataSource methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return _numSections
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _keys.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(_cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let row = indexPath.row
        if row >= 0 && row < _keys.count {
            cell.textLabel?.text = _attributes[row]
            cell.detailTextLabel?.text = row == 0 ? title: _info.objectForKey(_keys[row])?.stringValue
        }
        return cell
    }
    //End of UITableViewDataSource methods

    /// Dismisses this app when right button is tapped.
    func rightButtonClicked(sender: UIBarButtonItem) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

/// Defines each cell in the file descriptor list.
class FileDescriptorCell: UITableViewCell {
    override init() {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}