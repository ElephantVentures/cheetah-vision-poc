//
//  cheetahApp.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/18/24.
//

import SwiftUI

@main
struct cheetahApp: App {
    @State private var selectedRoom = ""

    var body: some Scene {
        WindowGroup {
            ContentView(selectedRoom: $selectedRoom)
        }
        
        ImmersiveSpace(id: "ImmersiveGym") {
            if ["lemon", "mountain", "beach", "person"].contains(selectedRoom) {
                ImmersiveVideoView(selectedRoom: $selectedRoom)
            } else {
                ImmersiveView(selectedRoom: $selectedRoom)
            }
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
