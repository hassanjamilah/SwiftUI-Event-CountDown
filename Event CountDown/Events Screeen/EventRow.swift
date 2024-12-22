//
//  Event Row.swift
//  EventCountDown
//
//  Created by Hassan Jamila on 22/12/24.
//

import SwiftUI

struct Event_Row: View {
    @State var event: EventModel
    
    var formatedDate: String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = ""
        return ""
    }
    var body: some View {
        VStack {
            
        }
        
    }
}

#Preview {
    Event_Row(event: DataHandler.SAMPLE_DATA.first!)
}
