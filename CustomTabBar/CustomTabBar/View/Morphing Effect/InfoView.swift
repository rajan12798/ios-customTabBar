//
//  InfoView.swift
//  CustomTabBar
//
//  Created by rajan kumar on 25/10/24.
//


 import SwiftUI

struct InfoView: View {
    @State var selectedPage:Page = .page1
    var body: some View {
        GeometryReader
        { geometry in
            VStack{
               
                Spacer()
                MorphingView(symbol: selectedPage.rawValue, config: .init(font: .system(size: 100,weight: .bold), frame: .init(width: 250, height: 200), radius: 30, foregroundColor: .white))
                title(Size: geometry.size)
                Spacer()
                indicatorView()
                ContinueButton()
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .top){
                header()
            }
        }
        .background {
            Rectangle()
                .fill(Color.black.gradient)
                .ignoresSafeArea()
        }
    }
    @ViewBuilder func title(Size:CGSize) -> some View {
        VStack(spacing:8){
            HStack(alignment:.top,spacing: 0){
                ForEach(Page.allCases,id: \.index){ page in
                    Text(page.title)
                        .lineLimit(1)
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.1)
                        .foregroundStyle(.white)
                    
                        .frame(width: Size.width)
 
                }
            }.offset(x: -CGFloat(selectedPage.index)*Size.width)
                .animation(.smooth(duration: 0.7,extraBounce: 0.1), value: selectedPage)
            HStack(alignment:.top,spacing: 0){
                ForEach(Page.allCases,id: \.index){ page in
                    Text(page.subtitle)
                        .lineLimit(1)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .kerning(1.1)
                        .foregroundStyle(.gray)
                        .frame(width: Size.width)
 
                }
            }.offset(x: -CGFloat(selectedPage.index)*Size.width)
                .animation(.smooth(duration: 0.9,extraBounce: 0.1), value: selectedPage)
        }
        .frame(width: Size.width,alignment: .leading)
       
     
    }
    @ViewBuilder func ContinueButton() -> some View {
        Button(action: {
            selectedPage = selectedPage.nextPage ?? .page1
        }) {
            Text("Continue")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .padding(25)
        }
    }
    @ViewBuilder func indicatorView() -> some View {
        HStack{
            ForEach(Page.allCases,id: \.index){ page in
                Capsule()
                    .fill(selectedPage == page ? Color.white : Color.gray.opacity(0.5))
                    .frame(width: selectedPage == page ? 35 : 18, height: 15)
                    .animation(.smooth(duration: 0.9), value: selectedPage)
            }
        }
    }
    
    @ViewBuilder func header() -> some View {
        HStack{
            Button {
                selectedPage = selectedPage.nextPage ?? .page1
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .fontWeight(.bold)
                    .contentShape(.rect)
            }.opacity(selectedPage != .page1 ? 1 : 0)
            Spacer()
            Button {
                selectedPage =  .page4
            } label: {
                Text("Skip")
                    .font(.title2)
                    .fontWeight(.bold)
                    .contentShape(.rect)
            }

        }.padding(.horizontal,25)
         .foregroundStyle(.white)
        .animation(.snappy(duration: 0.1,extraBounce: 0.5), value: selectedPage)

    }
}

#Preview {
    InfoView()
}
