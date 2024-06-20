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
        ZStack(alignment: .leading) {
            Image("reception")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Spacer()
                Spacer()
                HStack(alignment: .center) {
                    Text("Equinox Gym Tour")
                        .font(.system(size: 60))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: 300)
                .padding(.horizontal)
                .padding(.top)
                
                HStack(alignment: .center) {
                    Text("Immerse yourself in a classy fitness experience that gives the workout vibes.")
                        .font(.system(size: 28))
                        .padding()
                }
                .frame(maxWidth: 400)
                .padding(.horizontal)
                
                Spacer()
                
                ThumbnailRow(selectedRoom: $selectedRoom)
                    .padding(.bottom)
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
}

#Preview(windowStyle: .automatic) {
    @State var selectedRoom = "lounge"
    return ContentView(selectedRoom: $selectedRoom)
}
