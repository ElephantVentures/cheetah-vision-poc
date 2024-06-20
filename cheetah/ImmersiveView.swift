import SwiftUI
import RealityKit

struct ImmersiveView: View {
    @Binding var selectedRoom: String
    
    var body: some View {
        RealityView { content in
            // Add skybox
            if let skybox = createSkybox() {
                content.add(skybox)
            }
            
            // Add test floating image entity
            if let floatingImageEntity = createTestFloatingImageEntity() {
                content.add(floatingImageEntity)
            }
        } update: { content in
            // Clear previous entities
            content.entities.removeAll()
            
            // Add skybox
            if let skybox = createSkybox() {
                content.add(skybox)
            }
            
            // Add test floating image entity
            if let floatingImageEntity = createTestFloatingImageEntity() {
                content.add(floatingImageEntity)
            }
        }
    }
    
    private func createSkybox() -> Entity? {
        // Create skybox mesh
        let skyBoxMesh = MeshResource.generateSphere(radius: 1000)
        
        // Create material for skybox
        guard let imageMaterial = createMaterial(named: selectedRoom) else { return nil }
        
        // Create skybox entity
        let skyboxEntity = Entity()
        skyboxEntity.components.set(
            ModelComponent(
                mesh: skyBoxMesh,
                materials: [imageMaterial]
            )
        )
        
        // Map texture to inner surface
        skyboxEntity.scale *= .init(x: -1, y: 1, z: 1)
        
        print("Skybox created with image: \(selectedRoom)")
        
        return skyboxEntity
    }
    
    private func createMaterial(named imageName: String) -> UnlitMaterial? {
        var material = UnlitMaterial()
        
        do {
            let texture = try TextureResource.load(named: imageName)
            material.color = .init(texture: .init(texture))
            print("Successfully loaded image: \(imageName)")
        } catch {
            print("Error loading image \(imageName): \(error)")
            return nil
        }

        return material
    }
    
    private func createTestFloatingImageEntity() -> Entity? {
        // Create mesh for the floating image
        let planeMesh = MeshResource.generatePlane(width: 0.5, depth: 0.5)
        
        // Image material
        guard let imageMaterial = createMaterial(named: "location") else { return nil }
        
        // Create entity
        let imageEntity = ModelEntity(mesh: planeMesh, materials: [imageMaterial])
        
        // Position the image entity in front of the user
        imageEntity.position = SIMD3(x: 10, y: 3, z: -10) // 1 meter in front of the user
        
        // Set the image entity's orientation to face the user
        let orientation = simd_quatf(angle: .pi, axis: SIMD3(x: 0, y: 1, z: 1))
        imageEntity.orientation = orientation
        
        print("Static floating image entity created at position: \(imageEntity.position)")
        
        return imageEntity
    }
}

#Preview {
    @State var selectedRoom = "lounge"
    return ImmersiveView(selectedRoom: $selectedRoom)
}
