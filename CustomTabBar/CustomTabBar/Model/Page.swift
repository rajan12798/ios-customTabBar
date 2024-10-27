//
//  Page.swift
//  CustomTabBar
//
//  Created by rajan kumar on 25/10/24.
//

import Foundation
import SwiftUI

enum Page: String,CaseIterable {
    case page1 = "figure.american.football"
    case page2 = "figure.australian.football"
    case page3 = "figure.core.training"
    case page4 =  "figure.outdoor.cycle"
    
    var title: String {
        switch self {
        case .page1: return "Americal football"
        case .page2: return "Australian football"
        case .page3: return "Core training"
        case .page4: return "Outdoor cycling"
        }
    }
    
    var subtitle: String {
        switch self {
        case .page1: return "Playstation"
        case .page2: return "Gamecontroller"
        case .page3: return "iCloud"
        case .page4: return "Bubble"
        }
    }
    
    var index: Int {
        switch self {
        case .page1: return 0
        case .page2: return 1
        case .page3: return 2
        case .page4: return 3
        }
    }
    var nextPage: Page? {
        guard index < Page.allCases.count - 1 else { return nil }
        return Page.allCases[index + 1]
    }
    
    var prevousPage: Page? {
        guard index > 0 else { return nil }
        return Page.allCases[index - 1]
    }
}
