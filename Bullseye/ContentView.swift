//
//  ContentView.swift
//  Bullseye
//
//  Created by Puneet Pugalia on 23/05/20.
//  Copyright © 2020 Puneet Pugalia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(ShadowStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(ShadowStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct ShadowStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            //target row
            HStack {
                Text("Put the bullseye as close as close as you can to:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            
            Spacer()
            
            //slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                Text("100").modifier(LabelStyle())
            }
            
            //button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                let roundedValue = sliderValueRounded()
                let points = pointsForCurrentRound()
                
                return Alert(
                    title: Text("\(alertTitle())"),
                    message: Text(
                        "The sliders value is \(roundedValue).\n" +
                        "You scored \(points) points in this round."
                    ),
                    dismissButton: .default(Text("Awesome!")) {
                        self.score += points
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    }
                )
            }
            
            Spacer()
            
            //score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start over")
                }
                
                Spacer()
                
                Text("Score: ").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                
                Spacer()
                
                Text("Round: ").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                
                Spacer()
                
                Button(action: {}) {
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        return abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus:Int
        
        if difference == 0 {
            bonus = 100
        }
        else if difference == 1 {
            bonus = 50
        }
        else {
            bonus = 0
        }
        
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title:String
        
        if(difference == 0) {
            title = "Perfect"
        }
        else if(difference < 5) {
            title = "Almost there"
        }
        else if(difference <= 10) {
            title = "Not bad"
        }
        else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func startNewGame () {
        sliderValue = 50.0
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
