//
//  Descriptor.swift
//  AppLS-Swift
//
//  Defines a simple file descriptor
//
//  Fields:
//  name: String    The name of the file/folder
//  isDir: Bool     Indicates whether this is a directory
//
//  Created by Qua Zi Xian on 26/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import Foundation

struct Descriptor {
    let name: String
    let isDir: Bool
}