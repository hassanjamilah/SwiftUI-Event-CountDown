//
//  EventsView.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import SwiftUI



struct EventsView: View {
    
    @State var events: [EventModel] = DataHandler.SAMPLE_DATA
    
    var body: some View {
        NavigationStack {
            List(events.sorted(by: { event1, event2 in
                event1.date < event2.date
            }), id: \.id) { event in
                NavigationLink(value: event) {
                    EventRow(event: event)
                }
                .swipeActions(content: {
                    Button {
                        events.removeAll(where: { $0.id == event.id })
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)

                })
            }
            .navigationDestination(for: EventModel.self) { event in
                EventForm(editMode: .edit(event), onSave: { event in
                    if let index = events.firstIndex(where: { $0.id == event.id }) {
                        events.remove(at: index)
                        events.append(event)
                    }

                })
            }
            .toolbar(content: {
                NavigationLink {
                    EventForm(editMode: .addNew, onSave: { event in
                        print("Add the new event")
                        events.append(event)
                    })
                } label: {
                    Image(systemName: "plus")
                }
            })
            
        }
    }
}

#Preview {
    EventsView()
}
