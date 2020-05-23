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
                    Slider(value: .constant(10))
                    Text("100")
                }
                
                //button row
                Button(action: {
                    self.alertIsVisible = true;
                }) {
                    Text("Hit me!")
                }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    return Alert(
                        title: Text("Hello There"),
                        message: Text("This is my first popup."),
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
