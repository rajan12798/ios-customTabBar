//
//  TabPosition.swift
//  CustomTabBar
//
//  Created by rajan kumar on 21/10/24.
//

import SwiftUI

struct PositionKey: PreferenceKey {
    static var defaultValue: CGRect =   .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder func position(completion: @escaping (CGRect) -> ()) -> some View {
        self.overlay {
            GeometryReader { geometry in
                let rect = geometry.frame(in: .global)
                
                Color.clear.preference(key: PositionKey.self, value: rect)
                    .onPreferenceChange(PositionKey.self, perform: completion)
            }
        }
    }
}
