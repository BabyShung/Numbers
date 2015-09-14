//
//  String+Additions.swift
//  Rambos
//
//  Created by Hao Zheng on 9/3/15.
//  Copyright (c) 2015 Planhola.com. All rights reserved.
//

import Foundation

/** Additions Extends String

*/
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}