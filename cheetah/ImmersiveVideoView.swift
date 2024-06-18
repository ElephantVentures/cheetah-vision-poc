//
//  ImmersiveVideoView.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/21/24.
//

import SwiftUI
import RealityKit
import AVKit

struct ImmersiveVideoView: View {
    @Binding var selectedRoom: String
    
    var body: some View {
        RealityView { content in
            guard let skyBox = generateSkyBox() else { return }
            content.add(skyBox)
        } update: { content in
            content.entities.removeAll()
            guard let skybox = generateSkyBox() else { return }
            content.add(skybox)
        }
        .onDisappear()
    }
    
    func generateVideoMaterial() -> VideoMaterial? {
        let ext = ["beach", "people"].contains(selectedRoom) ? "mp4" : "mov"
        guard let url = Bundle.main.url(forResource: selectedRoom, withExtension: ext) else {
            print("Error loading video")
            return nil
        }
        
        let player = AVPlayer(url: url)
        
        let videoMaterial = VideoMaterial(avPlayer: player)
        player.play()
        player.actionAtItemEnd = .none
        
        // play on loop
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: .zero)
            player.play()
        }
        return videoMaterial
    }
    
    func generateSkyBox() -> Entity? {
        let skyBoxMesh = MeshResource.generateSphere(radius: 1000)
        guard let videoMaterial = generateVideoMaterial() else {
            return nil
        }
        let skyBoxEntity = ModelEntity(mesh: skyBoxMesh, materials: [videoMaterial])
        skyBoxEntity.scale *= .init(x: -1, y: 1, z: 1)
        return skyBoxEntity
    }
}

#Preview {
    @State var selectedRoom = "lounge"
    return ImmersiveVideoView(selectedRoom: $selectedRoom)
}
