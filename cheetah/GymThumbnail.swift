//
//  GymThumbnail.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/20/24.
//

import SwiftUI

struct GymThumbnail: View {
    @Binding var selectedRoom: String
    @Binding var isSpaceOpen: Bool
    @Environment(\.openImmersiveSpace) var openImmersiveSpace

    var imageName: String

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(imageName)
                .resizable()
            
            Button(action: {
                selectedRoom = imageName
                if !isSpaceOpen {
                    Task {
                        isSpaceOpen = true
                        await openImmersiveSpace(id: "ImmersiveGym")
                    }
                }
            }, label: {
                Text("\(imageName)")
                    .frame(maxWidth: .infinity)
            })
            .frame(maxWidth: .infinity)
        }
        .frame(width: 150, height: 150)
    }
}

#Preview {
    @State var selectedRoom = "lounge"
    @State var isSpaceOpen = false
    return GymThumbnail(selectedRoom: $selectedRoom, isSpaceOpen: $isSpaceOpen, imageName: Model.lounge.rawValue)
}
