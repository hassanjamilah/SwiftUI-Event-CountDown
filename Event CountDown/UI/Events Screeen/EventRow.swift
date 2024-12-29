//
//  Event Row.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import SwiftUI

struct EventRow: View {
    let event: EventModel
    @State var dateState: Date = Date()
    @State var formatedDiff: String = ""
    
    var body: some View {
        
        VStack {
            Text("\(event.title)")
                .foregroundStyle(event.textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .font(.title)
            Text("\(formatedDiff)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
        }
        
        
        .padding()
        .onAppear {
            dateState = event.date
            formatedDiff = dateState.getDateDiff()
            Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                formatedDiff = dateState.getDateDiff()
            }
        }
        
        
    }
    
}

#Preview {
    EventRow(event: DataHandler.SAMPLE_DATA.first!)
}
