//
//  EventModel.swift
//  Event CountDown
//
//  Created by Hassan Jamila on 14/12/24.
//

import Foundation
import SwiftUI

struct EventModel: Comparable, Identifiable, Hashable {
    static func < (lhs: EventModel, rhs: EventModel) -> Bool {
        lhs.date < rhs.date
    }
        
    var id = UUID()
    var title: String
    var date: Date
    var textColor: Color
    
    init(id: UUID = UUID(), eventTitle: String, evnetDate: Date, eventTextColor: Color) {
        self.id = id
        self.title = eventTitle
        self.date = evnetDate
        self.textColor = eventTextColor
    }
    
    init() {
        self.title = ""
        self.date = Date()
        self.textColor = .black
    }
}
