//
//  Pages.swift.swift
//  TodoList_UIKit
//
//  Created by Dmitro Kryzhanovsky on 27.05.2024.
//

import Foundation
import UIKit

enum Pages: CaseIterable {
    case manage
    case create
    case orgonaize
    
    var color: UIColor {
        switch self {
        case .manage:
            return .systemRed
        case .create:
            return .systemYellow
        case .orgonaize:
            return .systemGreen
        }
    }
    
    var index: Int {
        switch self {
        case .manage:
            return 0
        case .create:
            return 1
        case .orgonaize:
            return 2
        }
    }
}
