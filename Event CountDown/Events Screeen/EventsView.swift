//
//  EventsView.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import SwiftUI

struct EventsView: View {
    @State var events: [EventModel]
    
    var body: some View {
        NavigationStack {
            List(events.sorted(by: { event1, event2 in
                event1.evnetDate < event2.evnetDate
            }), id: \.id) { event in
                EventRow(event: event)
            }
        }
    }
}

#Preview {
    EventsView(events: DataHandler.SAMPLE_DATA)
}
