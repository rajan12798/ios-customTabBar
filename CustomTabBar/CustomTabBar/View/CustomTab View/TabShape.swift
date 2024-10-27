//
//  Untitled.swift
//  CustomTabBar
//
//  Created by rajan kumar on 21/10/24.
//

import SwiftUICore


struct TabShape: Shape {
    var midPoint: CGFloat
    var animatableData: CGFloat {
        get { midPoint }
        set { midPoint = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addPath(Rectangle().path(in: rect))
        path.addRelativeArc(center: CGPoint(x: midPoint, y: 0), radius: 40, startAngle: .degrees(180), delta: .degrees(-180))
        return path
    }
}
