//
//  EventModel.swift
//  Event CountDown
//
//  Created by Hassan Jamila on 14/12/24.
//

import Foundation
import SwiftUI

class EventModel: Comparable, Identifiable, Hashable {
    static func == (lhs: EventModel, rhs: EventModel) -> Bool {
        lhs.id == rhs.id
    }
    
    static func < (lhs: EventModel, rhs: EventModel) -> Bool {
        lhs.evnetDate < rhs.evnetDate
    }
    
    
    
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
        
    var id = UUID()
    var eventTitle: String
    var evnetDate: Date
    var eventTextColor: Color
    
    init(id: UUID = UUID(), eventTitle: String, evnetDate: Date, eventTextColor: Color) {
        self.id = id
        self.eventTitle = eventTitle
        self.evnetDate = evnetDate
        self.eventTextColor = eventTextColor
    }
    
    init() {
        self.eventTitle = ""
        self.evnetDate = Date()
        self.eventTextColor = .black
    }
}
