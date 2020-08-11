//
//  ContentView.swift
//  Bullseye
//
//  Created by Conor Fleming on 7/27/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var randomNumber = Int.random(in: 0...100)
    @State var sliderValue = 50.0
    @State var popUpVisible = false
    @State var score = 0
    @State var round = 1
    let midBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    
    struct viewStyler: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct valueStyler: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(Shadow())
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 5, y: 5)
        }
    }
    
    struct buttonTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
            .   font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    
    
    var body: some View {
        VStack {
        //target row
            Spacer()
            HStack{
                Text("Put the bullseye as close as you can to:").modifier(viewStyler())
                Text(" \(self.randomNumber)").modifier(valueStyler())
            }
        //Slider here
            Spacer()
            HStack{
                Text("1").modifier(viewStyler())
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100").modifier(viewStyler())
            }
        //Hit me button
            Spacer()
        Button(action: {
            print("button pressed")
            self.popUpVisible = true
        }) {
            Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(buttonTextStyle())
        }
        .alert(isPresented: $popUpVisible){ () ->
        Alert in
            if(Int(sliderValue) == randomNumber ){
                return Alert(title: Text("You Won!"),
                message: Text("You guessed \(Int(sliderValue)). You scored \(self.pointsAwarded()) points"),
                dismissButton: .default(Text("Play again")){
                    self.buttonDismissal()})
            }
            else{
                return Alert(title: Text("You Lost! :/"),
                message: Text("You guessed \(Int(sliderValue)). Thats Incorrect! You scored \(self.pointsAwarded()) points!"),
                dismissButton: .default(Text("Try again!")){
                    self.buttonDismissal()})            }
            }.background(Image("Button")).modifier(Shadow())
            Spacer()
        //Score row
            HStack{
                Button(action: {
                    self.resetGame()
                }) {
                    HStack{
                        Image("StartOverIcon")
                        Text("Start over").modifier(buttonTextStyle())
                        }
                }.background(Image("Button")).modifier(Shadow())
                Spacer()
                Text("Score:").modifier(viewStyler())
                Text("\(score)").modifier(valueStyler())
                Spacer()
                Text("Round:").modifier(viewStyler())
                Text("\(round)").modifier(valueStyler())
                Spacer()
                NavigationLink(destination: AboutView()){
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(buttonTextStyle())
                        }
                    }.background(Image("Button")).modifier(Shadow())
            }.padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midBlue)
        .navigationBarTitle("Bullseye 🎯")
    }
    
    func resetGame() {
        self.score = 0
        self.round = 1
        self.randomNumber = Int.random(in: 0...100)
        self.sliderValue = 50.0
    }
    
    func buttonDismissal() {
        self.score += self.pointsAwarded()
        self.round += 1
        self.randomNumber = Int.random(in: 0...100)
    }
    
    func pointsAwarded() -> Int{
        let difference = abs(randomNumber - Int(sliderValue))
        if difference == 0{
            return 200 - difference
        }else if difference == 1{
            return 150 - difference
        }
        else {
            return  100 - difference
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
