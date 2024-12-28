//
//  EventForm.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import SwiftUI

enum EditMode {
    case addNew
    case edit(EventModel)
}

struct EventForm: View {
    @State var event: EventModel = EventModel()
    @State var selectedColor: Color = .black
    var editMode: EditMode
    var onSave: (EventModel) -> Void
    @State var isSaveButtonDisabled: Bool = false
    
    var body: some View {
        Form {
            TextField("Event Title", text: $event.eventTitle)
                .foregroundStyle(selectedColor)
            DatePicker("Event Date", selection: $event.evnetDate)
            ColorPicker("Event Color", selection: $selectedColor)
        }
       
        .toolbar {
            Button(action: {
                event.eventTextColor = selectedColor
               onSave(event)
                isSaveButtonDisabled = true
            }, label: {
                Image(systemName: "checkmark")
            })
            .disabled(isSaveButtonDisabled)
            
        }
        .onAppear {
            switch editMode {
            case .addNew:
                event = EventModel()
            case .edit(let eventModel):
                event = eventModel
                selectedColor = eventModel.eventTextColor
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        EventForm(editMode: .addNew, onSave: { event in
            print("hello")
        })
    }
    
}
