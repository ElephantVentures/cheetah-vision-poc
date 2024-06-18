//
//  ImmersiveAudio.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/22/24.
//

import SwiftUI
import AVFoundation

struct ImmersiveAudio: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()

      var body: some View {
        VStack {
          Button(action: {
            audioPlayerViewModel.playOrPause()
          }) {
              Text("Begin meditation")
              Image(systemName: audioPlayerViewModel.isPlaying ? "pause.circle" : "play.circle")
              .resizable()
              .frame(width: 50, height: 50)
          }
        }
        .glassBackgroundEffect()
      }
}

#Preview {
    ImmersiveAudio()
}
