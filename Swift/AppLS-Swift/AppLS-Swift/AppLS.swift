//
//  AppLS.swift
//  AppLS-Swift
//
//  Defines the app's controller instance.
//
//  Created by Qua Zi Xian on 26/4/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import Foundation
import UIKit

public class AppLS {
    class var viewController: UINavigationController {
        return UINavigationController(rootViewController: FileListViewController())
    }
}