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
    @State var score = 0;
    @State var round = 1;
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                //target row
                HStack {
                    Text("Put the bullseye as close as you can to:")
                    Text("\(target)")
                }
                
                Spacer()
                
                //slider row
                HStack {
                    Text("1")
                    Slider(value: $sliderValue, in: 1...100)
                    Text("100")
                }
                
                //button row
                Button(action: {
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    let roundedValue = sliderValueRounded()
                    let points = pointsForCurrentRound();
                    
                    return Alert(
                        title: Text("\(alertTitle())"),
                        message: Text(
                            "The sliders value is \(roundedValue).\n" +
                            "You scored \(points) points in this round."
                        ),
                        dismissButton: .default(Text("Awesome!")) {
                            self.score += points
                            self.target = Int.random(in: 1...100)
                            self.round += 1;
                        }
                    )
                }
                
                Spacer()
                
                //score row
                HStack {
                    Button(action: {}) {
                        Text("Start over")
                    }
                    
                    Spacer()
                    
                    Text("Score: ")
                    Text("\(score)")
                    
                    Spacer()
                    
                    Text("Round: ")
                    Text("\(round)")
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Info")
                    }
                }.padding(.bottom, 20)
            }
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded());
    }
    
    func amountOff() -> Int {
        return abs(target - sliderValueRounded());
    }
    
    func pointsForCurrentRound() -> Int {
        100 - amountOff()
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title:String
        
        if(difference == 0) {
            title = "Perfect";
        }
        else if(difference < 5) {
            title = "Almost there";
        }
        else if(difference <= 10) {
            title = "Not bad";
        }
        else {
            title = "Are you even trying?"
        }
        
        return title;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
