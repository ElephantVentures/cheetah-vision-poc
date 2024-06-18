//
//  Model.swift
//  cheetah
//
//  Created by Alexander Garcia on 5/20/24.
//

import Foundation

enum Model: String, CaseIterable, Identifiable {
    case bench, dumbbells, fitness, ladder, lounge, pulldown, squat, treadmill
    var id: Self { self }
}
