//
//  Event Row.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import SwiftUI

struct EventRow: View {
    @State var event: EventModel
    @State var formatedDiff: String = ""
    
    
        
    var body: some View {
        
        VStack {
            Text("\(event.eventTitle)")
                .foregroundStyle(event.eventTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .font(.title)
            Text("\(formatedDiff)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
        }
        
        .padding()
        .onAppear {
            formatedDiff = event.evnetDate.getDateDiff()
            Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                formatedDiff = event.evnetDate.getDateDiff()
            }
        }
        
        
    }
    
}

#Preview {
    EventRow(event: DataHandler.SAMPLE_DATA.first!)
}