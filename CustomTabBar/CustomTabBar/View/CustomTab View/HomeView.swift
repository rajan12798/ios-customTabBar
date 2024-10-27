//
//  HomeView.swift
//  CustomTabBar
//
//  Created by rajan kumar on 21/10/24.
//

import SwiftUI

struct HomeView: View {
    var nameSpace: Namespace.ID
    var body: some View {
        VStack{
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .matchedGeometryEffect(id: "Title", in: nameSpace)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .matchedGeometryEffect(id: "background", in: nameSpace)
    }
}
struct Profile: View {
    var nameSpace: Namespace.ID
    var body: some View {
        VStack{
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .matchedGeometryEffect(id: "Title", in: nameSpace)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .matchedGeometryEffect(id: "background", in: nameSpace)
    }
}
struct Settings: View {
    var nameSpace: Namespace.ID
    var body: some View {
        VStack{
            Spacer()
                .matchedGeometryEffect(id: "Title", in: nameSpace)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .matchedGeometryEffect(id: "background", in: nameSpace)
    }
}
struct More: View {
    var nameSpace: Namespace.ID
    var body: some View {
        VStack{
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .matchedGeometryEffect(id: "Title", in: nameSpace)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .matchedGeometryEffect(id: "background", in: nameSpace)
    }
}
struct Search: View {
    var nameSpace: Namespace.ID
    var body: some View {
        VStack{
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .matchedGeometryEffect(id: "Title", in: nameSpace)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .matchedGeometryEffect(id: "background", in: nameSpace)
    }
}
#Preview {
    @Namespace var nameSpace
    HomeView(nameSpace: nameSpace)
}
