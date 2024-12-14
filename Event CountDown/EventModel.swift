//
//  EventModel.swift
//  Event CountDown
//
//  Created by Hassan Jamila on 14/12/24.
//

import Foundation
import SwiftUI

struct EventModel: Comparable, Identifiable {
    static func < (lhs: EventModel, rhs: EventModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var eventTitle: String
    var evnetDate: Date
    var eventTextColor: Color
}
