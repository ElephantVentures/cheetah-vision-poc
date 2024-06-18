//
//  ImmersiveView.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/20/24.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    @Binding var selectedRoom: String
    
    var body: some View {
        RealityView { content in
            guard let skybox = createSkybox() else { return }
            content.add(skybox)

        } update: { content in
            // remove previous image skybox
            content.entities.removeAll()
            // add a new skybox
            guard let skybox = createSkybox() else { return }
            content.add(skybox)
        }
    }
    
    private func createSkybox () -> Entity? {
        // create mesh
        let skyBoxMesh = MeshResource.generateSphere(radius: 1000)
        
        // image material
        guard let imageMaterial = createMaterial() else { return nil }
        
        // create entity
        let skyboxEntity = Entity()
        skyboxEntity.components.set(
            ModelComponent(
                mesh: skyBoxMesh,
                materials: [imageMaterial]
            )
        )

        // map texture to inner surface
        skyboxEntity.scale *= .init(x: -1, y: 1, z: 1)
        
        return skyboxEntity
    }
    
    private func createMaterial () -> UnlitMaterial? {
        var material = UnlitMaterial()
        
        do {
            let texture = try TextureResource.load(named: selectedRoom)
            material.color = .init(texture: .init(texture))

        } catch {
            print("Error loading image \(error)")
        }

        return material
    }
}

#Preview {
    @State var selectedRoom = "lounge"
    return ImmersiveView(selectedRoom: $selectedRoom)
}
