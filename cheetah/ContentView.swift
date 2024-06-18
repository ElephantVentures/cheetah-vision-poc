//
//  ContentView.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/18/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @Binding var selectedRoom: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ReceptionBackground()
            ThumbnailRow(selectedRoom: $selectedRoom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .ornament(
            visibility: selectedRoom == "fitness" ? .visible : .hidden,
            attachmentAnchor: .scene(.bottom)
        ) {
            ImmersiveAudio()
                .padding(.top, 70)
        }
    }
}

#Preview(windowStyle: .automatic) {
    @State var selectedRoom = "lounge"
    return ContentView(selectedRoom: $selectedRoom)
}
