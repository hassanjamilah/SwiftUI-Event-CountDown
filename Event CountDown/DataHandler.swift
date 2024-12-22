//
//  DataHandler.swift
//  Event CountDown
//
//  Created by Hassan Jamila on 14/12/24.
//

import Foundation

final class DataHandler {
    private static var allEvents: [EventModel] = []
    
    /**
        Used to add new event
        Parameter: An event to be inserted
     */
    static func addEvent(event: EventModel) {
        allEvents.append(event)
    }
    
    /**
        Used to update an event
        id: The id of the event that you want to update
        newEventData: The updated event
     */
    static func updateEvent(id: UUID, newEventData: EventModel) {
        if let index = allEvents.firstIndex(where: { $0.id == id }) {
            allEvents[index] = newEventData
        }
    }
    
    /**
        Used to remove an event
        id: The id of the event that you want to remove
     */
    static func removeEventByID(id: UUID) {
        allEvents.removeAll { event in
            event.id == id
        }
    }
    
    /**
        Used to get all the events
        Return: An array of events
     */
    static func getAllEvents() -> [EventModel] {
        return allEvents
    }
    
    /// Used in the unit tests to reset the events
    static func resetAllEvents() {
        allEvents = []
    }
    
    static let SAMPLE_DATA = [
        EventModel(eventTitle: "Event From 5 days", evnetDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, eventTextColor: .blue),
        EventModel(eventTitle: "Event From 2 Days", evnetDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, eventTextColor: .green),
        EventModel(eventTitle: "Event Today", evnetDate: Calendar.current.date(byAdding: .day, value: 0, to: Date())!, eventTextColor: .yellow),
    
    ]
}
