//
//  QuestView.swift
//  AdventureCompass
//
//  Created by Peter Flickinger on 4/25/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct QuestView: View {
    var quest: String
    var body: some View {
        Text("\(quest)").font(.title).padding()
    }
}

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView(quest: "Go on a jog")
    }
}
