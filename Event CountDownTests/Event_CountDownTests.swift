//
//  Event_CountDownTests.swift
//  Event CountDownTests
//
//  Created by Hassan Jamila on 14/12/24.
//

import XCTest
@testable import EventCountDown

final class Event_CountDownTests: XCTestCase {

    func testAddEvent() {
        DataHandler.resetAllEvents()
        let oldEvents = DataHandler.getAllEvents()
        XCTAssertTrue(oldEvents.isEmpty)
        let newEvent = EventModel(eventTitle: "Event 1", evnetDate: Date(), eventTextColor: .red)
        DataHandler.addEvent(event: newEvent)
        XCTAssertEqual(1, DataHandler.getAllEvents().count)
        let insertedEvent = DataHandler.getAllEvents().first
        XCTAssertEqual(newEvent.id, insertedEvent?.id)
        XCTAssertEqual(newEvent.eventTitle, insertedEvent?.eventTitle)
        XCTAssertEqual(newEvent.evnetDate, insertedEvent?.evnetDate)
        XCTAssertEqual(newEvent.eventTextColor, insertedEvent?.eventTextColor)
    }

    func testUpdateEvent() {
        DataHandler.resetAllEvents()
        let newEvent = EventModel(eventTitle: "Event 1", evnetDate: Date(), eventTextColor: .red)
        DataHandler.addEvent(event: newEvent)
        var updatedEvent = newEvent
        let updatedTitle = "Updated Event"
        updatedEvent.eventTitle = updatedTitle
        DataHandler.updateEvent(id: newEvent.id, newEventData: updatedEvent)
        let firstEvent = DataHandler.getAllEvents().first
        XCTAssertEqual(firstEvent?.eventTitle, updatedTitle)
    }

    func testRemoveEvent() {
        DataHandler.resetAllEvents()
        let newEvent = EventModel(eventTitle: "Event 1", evnetDate: Date(), eventTextColor: .red)
        let newEvent1 = EventModel(eventTitle: "Event 2", evnetDate: Date(), eventTextColor: .red)
        DataHandler.addEvent(event: newEvent)
        DataHandler.addEvent(event: newEvent1)
        XCTAssertEqual(2, DataHandler.getAllEvents().count)
        XCTAssertEqual(newEvent.id, DataHandler.getAllEvents().first?.id)
        XCTAssertEqual(newEvent1.id, DataHandler.getAllEvents()[1].id)
        DataHandler.removeEventByID(id: newEvent.id)
        XCTAssertEqual(1, DataHandler.getAllEvents().count)
        XCTAssertEqual(newEvent1.id, DataHandler.getAllEvents().first?.id)
    }

    func testGetEvent() {
        DataHandler.resetAllEvents()
        let newEvent = EventModel(eventTitle: "Event 1", evnetDate: Date(), eventTextColor: .red)
        let newEvent1 = EventModel(eventTitle: "Event 2", evnetDate: Date(), eventTextColor: .red)
        DataHandler.addEvent(event: newEvent)
        DataHandler.addEvent(event: newEvent1)
        XCTAssertEqual(2, DataHandler.getAllEvents().count)
    }

}
