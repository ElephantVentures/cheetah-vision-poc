//
//  ReceptionBackground.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/20/24.
//

import SwiftUI

struct ReceptionBackground: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Image("reception")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            HStack(alignment: .center) {
                Text("Equinox Gym Tour")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ReceptionBackground()
}
