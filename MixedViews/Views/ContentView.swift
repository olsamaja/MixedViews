//
//  ContentView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    let sections = RowModel.sections
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { section in
                    SectionRows(sectionModel: section)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
