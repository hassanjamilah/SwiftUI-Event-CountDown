//
//  Date+Ex.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import Foundation

extension Date {
    func getDateDiff() -> String {
        let formater = RelativeDateTimeFormatter()
        formater.unitsStyle = .full
        return formater.localizedString(for: self, relativeTo: Date.now)
    }
}
