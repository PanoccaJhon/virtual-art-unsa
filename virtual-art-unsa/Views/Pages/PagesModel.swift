//
//  PagesModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/18/24.
//

import Foundation
import SwiftUI

enum PagesModel: CaseIterable {
    case home
    case works
    case exhibitions
    case map
    case user
    
    // Asocia cada caso con una vista personalizada
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            HomeView()
        case .works:
            PinturasView()
        case .exhibitions:
            ExposicionesView()
        case .map:
            MapView()
        case .user:
            UserView()
        }
    }
}
