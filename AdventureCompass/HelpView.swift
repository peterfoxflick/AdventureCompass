//
//  HelpView.swift
//  AdventureCompass
//
//  Created by Peter Flickinger on 4/25/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Welcome to the Adventure Compass")
                .font(.title).padding()
            
            Text("Walk the directions given to you on the main screen, when you finished walking a block in the given direction, tap the arrow to recive a new direction. Please be smart about not walking off cliffs or anything and stay alert to the area around you. At the end of an adventure you will be given a prompt! When you swipe back to the main screen, simply click on the 'here' symbol to generate a new adventure. This app was inspired by a chapter in the book 'The 2 AM Principle' which you can checkout below.")
                .multilineTextAlignment(.leading)
                .padding()
                .lineLimit(nil)
            
            Button(action:{
                if let url = URL(string: "https://www.amazon.com/AM-Principle-Discover-Science-Adventure/dp/B01N9CZI4Q/ref=sr_1_1?dchild=1&keywords=The+2+AM+Principle&qid=1587850018&s=books&sr=1-1") {
                    UIApplication.shared.open(url)
                }
            }) {
                VStack{
                Image(systemName: "book.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:100)
                    .foregroundColor(.blue)
                    
                    Text("The 2 AM Principle").font(.headline)
                }.padding()
            }
            
            Spacer()
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
