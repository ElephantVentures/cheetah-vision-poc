//
//  ThumbnailRow.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/20/24.
//

import SwiftUI

struct ThumbnailRow: View {
    @Binding var selectedRoom: String
    @State private var isSpaceOpen = false

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Model.allCases) { room in
                    GymThumbnail(selectedRoom: $selectedRoom, isSpaceOpen: $isSpaceOpen, imageName: room.rawValue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
        }
    }
}

#Preview {
    @State var selectedRoom = "lounge"
    return ThumbnailRow(selectedRoom: $selectedRoom)
}
