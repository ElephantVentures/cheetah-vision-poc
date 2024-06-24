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
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .clipped()
                .cornerRadius(20)
            
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
            .background(Color.black.opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding(8) // Add padding between images
        .border(selectedRoom == imageName ? Color.gray : Color.clear, width: 4) // Add conditional border with wider width
        .cornerRadius(8)
    }
}

// Preview code remains unchanged
#Preview {
    @State var selectedRoom = "lounge"
    @State var isSpaceOpen = false
    return GymThumbnail(selectedRoom: $selectedRoom, isSpaceOpen: $isSpaceOpen, imageName: "lounge")
}
