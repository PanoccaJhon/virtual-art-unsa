//
//  ElementosUIApp.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/12/24.
//

import SwiftUI


struct ElementosUIApp: App {
    @State var isloggedin:Bool = false
    var body: some Scene {
        WindowGroup {
            if isloggedin{
                PinturaView()
            }else{
                ContentView()
            }
        }
    }
}
