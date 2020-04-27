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
    var quest = Quest()
    @State var showingQuest = false
    @State var showingHelp = false

    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .yellow]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action:{
                        self.showingHelp.toggle()
                    }) {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:40)
                            .foregroundColor(.white)
                            .padding()
                    }.sheet(isPresented: $showingHelp){
                        HelpView()
                    }
                }
                Spacer()
            }
            
            Button(action: {
                if self.compass.nextIsEnd() {
                    self.showingQuest.toggle()
                }
                self.compass.next()
            }) {
                
                // How the button looks like
                if self.compass.getDirCount() > 1 {
                    self.compass.getDir().getImage()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .foregroundColor(.white)
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
                        .foregroundColor(.white)
                        .transition(.opacity)
                }
                
            }.sheet(isPresented: $showingQuest){
                QuestView(quest: self.quest.getQuest())
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
