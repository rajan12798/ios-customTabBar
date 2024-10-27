//
//  TabView.swift
//  CustomTabBar
//
//  Created by rajan kumar on 20/10/24.
//

import SwiftUI
struct CustomTabView: View {
    @State var selectedTab:TabItem = .home
    @Namespace var animation
    @State var tabShapePosition:CGPoint = .zero
    var body: some View {
        ZStack{
            /*TabView(selection: $selectedTab)*/ HStack{
                switch selectedTab{
                case .home:
                    HomeView(nameSpace: animation)
                        .tag(TabItem.home)
                        .toolbar(.hidden,for: .tabBar)

                case .profile:
                    Profile(nameSpace: animation)
                        .tag(TabItem.profile)
                        .toolbar(.hidden,for: .tabBar)
               
                case .more:
                    More(nameSpace: animation)
                        .tag(TabItem.more)
                        .toolbar(.hidden,for: .tabBar)
                    case .settings:
                    Settings(nameSpace: animation)                    .tag(TabItem.settings)
                        .toolbar(.hidden,for: .tabBar)
                    case .search:
                    Search(nameSpace: animation)
                        .tag(TabItem.search)
                        .toolbar(.hidden,for: .tabBar)
                }
            }

            VStack{Spacer()
                CustomtabBar()
            }
        }
    }
    
    @ViewBuilder func CustomtabBar(_ tint: Color = .pink, _ inactiveTint: Color = .gray)-> some View{
        HStack(alignment: .bottom,spacing: 0){
            ForEach(TabItem.allCases, id:\.rawValue) { tabItem in
                TabItemView(inactiveTint: inactiveTint, tint: tint, tab: tabItem, activeTab: $selectedTab,position: $tabShapePosition, animation: animation)
            }
        }
        .padding(.horizontal,15)
        .padding(.top,70)
        .background(content:{
            TabShape(midPoint: tabShapePosition.x)
                .fill(Color.white.gradient)
                .ignoresSafeArea()
                .shadow(color: .gray .opacity(0.5),radius: 5,x:0,y: -5)
                .blur(radius: 1.5)
                .padding(.top,25)
                .background(content:{
                    Circle()
                        .fill(Color.pink.gradient)
                        .shadow(color: tint.opacity(0.2),radius: 5,x:0,y: -5)
                        
                        .frame(width: 25)
                       
                        .position(x:tabShapePosition.x,y: +30)
                })
        })
       .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7,blendDuration: 0.7), value: selectedTab)
     
    }
}
struct TabItemView:  View {
    var inactiveTint: Color
    var tint: Color
    var tab: TabItem
    @Binding var activeTab: TabItem
    @Binding var position: CGPoint
    var animation: Namespace.ID
    @State var tabItemPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing:5){
            Image(systemName: tab.image)
                .font(.title2)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 58)
                .foregroundStyle(activeTab == tab ? .white: inactiveTint)

                .background{
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            Text(tab.rawValue)
                .font(.caption)
                .foregroundStyle(activeTab == tab ? tint: .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .position(completion: { rect in
            tabItemPosition.x = rect.midX
            if activeTab == tab {
                position.x = rect.midX            }
        })
        .onTapGesture {
            activeTab = tab
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7,blendDuration: 0.7)) {
                position.x = tabItemPosition.x
            }
        }
    }
    
}
#Preview {
    CustomTabView()
}




