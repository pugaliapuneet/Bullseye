//
//  ContentView.swift
//  Bullseye
//
//  Created by Puneet Pugalia on 23/05/20.
//  Copyright © 2020 Puneet Pugalia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible:Bool = false;
    @State var sliderValue:Double = 50.0;
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                //target row
                HStack {
                    Text("Put the bullseye as close as you can to:")
                    Text("100")
                }
                
                Spacer()
                
                //slider row
                HStack {
                    Text("1")
                    Slider(value: self.$sliderValue, in: 1...100)
                    Text("100")
                }
                
                //button row
                Button(action: {
                    self.alertIsVisible = true;
                }) {
                    Text("Hit me!")
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    var roundedValue:Int = Int(self.sliderValue.rounded())
                    return Alert(
                        title: Text("Hello There"),
                        message: Text("The sliders value is \(roundedValue)."),
                        dismissButton: .default(Text("Awesome!"))
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
                    Text("999999")
                    
                    Spacer()
                    
                    Text("Round: ")
                    Text("999")
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Info")
                    }
                }.padding(.bottom, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
