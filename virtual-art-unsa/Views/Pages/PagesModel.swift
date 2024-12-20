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
    func view(tabSelector:Binding<TabModel>) -> some View {
        switch self {
        case .home:
            HomeView(selectedTab: tabSelector)
        case .works:
            PinturasView(selectedTab: tabSelector)
        case .exhibitions:
            ExposicionesView(selectedTab: tabSelector)
        case .map:
            MapView(selectedTab: tabSelector)
        case .user:
            UserView(selectedTab: tabSelector)
        }
    }
}
