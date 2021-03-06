//
//  MixedViewsApp.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

@main
struct MixedViewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    let navBarAppearance = UINavigationBarAppearance()
                    
                    navBarAppearance.configureWithOpaqueBackground()
                    navBarAppearance.backgroundColor = .white
                    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

                    UINavigationBar.appearance().standardAppearance = navBarAppearance
                    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
                    
                    UITableView.appearance().backgroundColor = .defaultBackround
                }
        }
    }
}
