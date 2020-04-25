//
//  Quest.swift
//  AdventureCompass
//
//  Created by Peter Flickinger on 4/25/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation

class Quest {
    private var quests = [String]()
    
    init(){
        load()
    }
    
    public func getQuest() -> String {
        let index = Int.random(in:0..<self.quests.count)
        return quests[index]
    }
    
    //Thanks https://medium.com/@rbreve/displaying-a-list-with-swiftui-from-a-remote-json-file-6b4e4280a076
    private func load() {
        let url = URL(string: "https://peterfoxflick.com/AdventureCompassQuests.json")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([String].self, from: d)
                    DispatchQueue.main.async {
                        self.quests = decodedLists
                    }
                }else {
                    //TODO: Add a default lists
                    self.quests = [
                      "Take a photo emphisizing the rule of thrids",
                      "Take a blank and white photo",
                      "Take a photo emphisizing low light",
                      "Take a portrait photo",
                      "Take a photo emphisizing color",
                      "Take a photo emphisizing centering a shot",
                      "Take a snapshot of a photo",
                      "Take a photo of love",
                      "Take a photo of feet (or shoes)",
                      "Take a photo emphisizing light and darkness"
                    ]
                }
            } catch {
                print ("Error: ", error)
            }
            
        }.resume()
    }

}
