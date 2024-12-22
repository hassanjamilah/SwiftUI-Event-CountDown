//
//  Date+Ex.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import Foundation

extension Date {
    var isPassed: Bool {
        self < Date()
    }
    
    func calculateDateDiff() -> String {
        let diff = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date(), to: self)
        print(diff)
        if let years = diff.year, abs(years) > 0 {
            return createDateDiffMessage(value: years, dateComponentName: "year")
        } else if let months = diff.month, abs(months) > 0 {
            return createDateDiffMessage(value: months, dateComponentName: "month")
        } else if let days = diff.day, abs(days) > 0 {
            return createDateDiffMessage(value: days, dateComponentName: "day")
        } else if let hours = diff.hour, abs(hours) > 0 {
            return createDateDiffMessage(value: hours, dateComponentName: "hour")
        } else if let minutes = diff.minute, abs(minutes) > 0 {
            return createDateDiffMessage(value: minutes, dateComponentName: "minute")
        } else {
            return "Less than one minute"
        }
    }
    
    func createDateDiffMessage(value: Int, dateComponentName: String) -> String {
        if value > 0 {
            return value > 1 ? "In \(value) \(dateComponentName)s" : "Next \(dateComponentName)"
        } else {
            return "\(abs(value)) \(dateComponentName)s ago"
        }
    }
}
