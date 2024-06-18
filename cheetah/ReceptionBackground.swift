//
//  ReceptionBackground.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/20/24.
//

import SwiftUI

struct ReceptionBackground: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image(.reception)
                .resizable()
                .opacity(0.7)
            Text("Equinox gym tour")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ReceptionBackground()
}
