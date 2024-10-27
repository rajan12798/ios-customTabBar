//
//  MorphingView.swift
//  CustomTabBar
//
//  Created by rajan kumar on 25/10/24.
//

import SwiftUI

 struct MorphingView: View {
     var symbol: String
     var config: Config
     @State var trigger: Bool = false
     @State var displayingSymbol:String = ""
     @State var nextSymbol:String = ""
     var body: some View {
             Canvas { ctx, size in
                 
                 ctx.addFilter(.alphaThreshold(min: 0.4,color: config.foregroundColor))
                 
                 if let renderdImage = ctx.resolveSymbol(id: 0){
                     ctx.draw(renderdImage,at:CGPoint(x: size.width/2, y: size.height/2))
                 }
             } symbols: {
                 ImageView()
                     .tag(0)
             }
             .frame(width: config.frame.width, height: config.frame.height)
             .onChange(of: symbol) { oldValue, newValue in
                 trigger.toggle()
                 nextSymbol = newValue
             }
             .task {
                 guard displayingSymbol == "" else { return }
                 displayingSymbol =  symbol
             }
         
    }
     @ViewBuilder
     func ImageView() -> some View {
         KeyframeAnimator(initialValue: CGFloat.zero, trigger: trigger){ radius in
             Image(systemName: displayingSymbol)
                 .font(config.font)
//                 .foregroundStyle(config.foregroundColor)
                 .blur(radius: radius)
                 .frame(width: config.frame.width,height: config.frame.height)
                 .onChange(of: radius) { oldValue, newValue in
                     if newValue.rounded() == config.radius{
                         withAnimation(config.symbolAnimation){
                             displayingSymbol = nextSymbol
                         }
                     }
                 }
             
         } keyframes: {_ in
             CubicKeyframe(config.radius, duration: config.keyframeDuration)
             CubicKeyframe(0, duration: config.keyframeDuration)
         }
      
             
     }
     struct Config {
         var font: Font
         var frame: CGSize
         var radius: CGFloat
         var foregroundColor: Color
         var keyframeDuration:CGFloat = 0.4
         var symbolAnimation: Animation = .smooth(duration: 0.5,extraBounce: 0)
     }
}

#Preview {
    MorphingView(symbol: "gearshape.fill", config: .init(font: .system(size: 100,weight: .bold), frame: .init(width: 100, height: 100), radius: 1, foregroundColor: .black))
}
