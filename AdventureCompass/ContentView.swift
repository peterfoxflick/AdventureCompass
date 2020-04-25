//
//  ContentView.swift
//  AdventureCompass
//
//  Created by Peter Flickinger on 4/25/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var compass = Compass()
    
    var body: some View {
        HStack{
            Button(action: {
                self.compass.next()
            }) {
                // How the button looks like
                if self.compass.getDirCount() > 1 {
                    self.compass.getDir().getImage()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .overlay(
                      Image(systemName: "\(self.compass.getDirCount()).circle")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .foregroundColor(.red)
                      .frame(height: 30)
                        .transition(.opacity),
                      alignment: .topTrailing
                    )
                } else {
                    self.compass.getDir().getImage()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .transition(.opacity)
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
