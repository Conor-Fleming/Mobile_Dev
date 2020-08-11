//
//  AboutView.swift
//  Bullseye
//
//  Created by Conor Fleming on 7/28/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    struct headingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(Color.black)
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct textStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    var body: some View {
        Group{
            VStack{
                Text("🎯 Bullseye 🎯").modifier(headingStyle()).lineLimit(nil)
                Text("This is Bullseye!").modifier(textStyle()).lineLimit(nil)
                Text("Drag the slider as close as you can to the target number! The closer you are the more points you will earn!").modifier(textStyle()).lineLimit(nil)
            }
            .navigationBarTitle("Bullseye 🎯")
            .background(Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0))
        }.background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
