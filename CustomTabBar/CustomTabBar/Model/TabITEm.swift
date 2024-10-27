//
//  TabITEm.swift
//  CustomTabBar
//
//  Created by rajan kumar on 21/10/24.
//

import Foundation

enum TabItem: String, CaseIterable {
    case home = "Home"
    case profile = "Profile"
    case settings = "Settings"
    case more = "More"
    case search = "Search"
    
    var image: String {
        switch self {
        case .home: return "house"
        case .profile: return "person"
        case .settings: return "gear"
        case .more: return "ellipsis"
        case .search: return "magnifyingglass"
        }
    }
    
    var index: Int {
        switch self {
        case .home: return 0
        case .profile: return 1
        case .settings: return 2
        case .more: return 3
        case .search: return 4
        }
    }
}
