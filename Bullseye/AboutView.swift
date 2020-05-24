//
//  AboutView.swift
//  Bullseye
//
//  Created by Puneet Pugalia on 24/05/20.
//  Copyright © 2020 Puneet Pugalia. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct headingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top, 60)
                .padding(.bottom, 60)
        }
    }
    
    struct bodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(headingStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(bodyStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are the more points you score.").modifier(bodyStyle())
                Text("Enjoy!").modifier(bodyStyle())
            }
            .background(beige)
            .navigationBarTitle("About Bullseye")
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
