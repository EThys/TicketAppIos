//
//  AppStyle.swift
//  visitKongo
//
//  Created by Muzola Ethberg on 21/03/2025.
//

import Foundation

struct AppStyle {
enum TextStyle {
    case title
    case sectionTitle
    case buttonCTA
    case description
    case navigationAction
    case navigationTitle
    
    var size: CGFloat {
        switch self {
        case .title:return 37
        case .sectionTitle:return 24
        case .buttonCTA:return 18
        case .description:return 16
        case .navigationAction:return 17
        case .navigationTitle:return 20
        }
    }
    
}

}
