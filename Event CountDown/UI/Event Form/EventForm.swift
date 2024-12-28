//
//  EventForm.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import SwiftUI

enum EditMode: Equatable {
    case addNew
    case edit(EventModel)
}

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @State var event: EventModel = EventModel()
    @State var selectedColor: Color = .black
    var editMode: EditMode
    var onSave: (EventModel) -> Void
    
    var body: some View {
        Form {
            TextField("Event Title", text: $event.title)
                .foregroundStyle(selectedColor)
            DatePicker("Event Date", selection: $event.date)
            ColorPicker("Event Color", selection: $selectedColor)
        }
        .navigationTitle(editMode == .addNew ? "Add Event" : "Edit \(event.title)")
       
        .toolbar {
            Button(action: {
                event.textColor = selectedColor
               onSave(event)
                dismiss()
            }, label: {
                Image(systemName: "checkmark")
            })            
            
        }
        .onAppear {
            switch editMode {
            case .addNew:
                event = EventModel()
            case .edit(let eventModel):
                event = eventModel
                selectedColor = eventModel.textColor
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
