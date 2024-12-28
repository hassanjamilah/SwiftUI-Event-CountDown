//
//  DataHandler.swift
//  Event CountDown
//
//  Created by Hassan Jamila on 14/12/24.
//

import Foundation

final class DataHandler {
    static let SAMPLE_DATA = [
        EventModel(eventTitle: "Event From 5 days", evnetDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, eventTextColor: .blue),
        EventModel(eventTitle: "Event From 2 Days", evnetDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, eventTextColor: .green),
        EventModel(eventTitle: "Event Today", evnetDate: Calendar.current.date(byAdding: .day, value: 0, to: Date())!, eventTextColor: .yellow),
    
    ]
}
