//
//  compass.swift
//  AdventureCompass
//
//  Created by Peter Flickinger on 4/25/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
import SwiftUI

enum Direction {
    case left, forward, right, backward, end
    
    func getImage() -> Image {
       switch self {
            case .left: return Image(systemName: "arrow.turn.up.left")
            case .forward: return Image(systemName: "arrow.up")
            case .right: return Image(systemName: "arrow.turn.up.right")
            case .backward: return Image(systemName: "arrow.uturn.down")
            case .end: return Image(systemName: "mappin.and.ellipse")
        }
    }
}

class Compass: ObservableObject {
    var direction = [Direction]()
    @Published var index = 0

    init(){
        self.generate()
    }
    
    public func next(){
        if self.index + 1 < self.direction.count {
            self.index += 1
        } else {
            self.generate()
        }
    }
    
    public func getDir() -> Direction {
        return self.direction[index]
    }
    
    public func getDirCount() -> Int {
        var o = index
        while o < self.direction.count && self.direction[index] == self.direction[o] {
            o += 1
        }
        return o - index
    }

    private func generate(){
        self.direction.removeAll()
        self.index = 0
        
        var i = 0
        let max = Int.random(in: 5...8)
        while (i < max) {
           self.direction.append(self.getRandDir())
           i += 1
        }
        
        self.direction.append(Direction.end)
    }
    
    private func getRandDir() -> Direction{
        let i = Int.random(in: 1...100)
        
        if i < 20 {
            return Direction.left
        } else if i < 70 {
            return Direction.forward
        } else if i < 90 {
            return Direction.right
        } else {
            return Direction.backward
        }
    }
    
    }

