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
    @State var whosThereisVisible:Bool = false;
    
    var body: some View {
        VStack {
            VStack {
                
                Text("Welcome to my first app!")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                
                Button(action: {
                    print("Button Pressed")
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
                
                Button(action: {
                    self.whosThereisVisible = true;
                }) {
                    Text("Knock Knock")
                }
                .alert(isPresented: $whosThereisVisible) { () ->
                    Alert in
                    return Alert(title: Text("Who's there?"), message: Text("A knock knock joke!"), dismissButton: .default(Text("Nice joke!")))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
