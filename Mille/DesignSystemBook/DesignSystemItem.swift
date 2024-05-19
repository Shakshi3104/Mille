//
//  DesignSystemItem.swift
//  Mille
//
//  Created by Mac mini M2 Pro on 2024/05/19.
//

import Foundation

enum DesignSystemItem: String, CaseIterable {
    case color = "Color"
    
    func symbolName() -> String {
        switch self {
        case .color:
            return "paintpalette"
        }
    }
}
