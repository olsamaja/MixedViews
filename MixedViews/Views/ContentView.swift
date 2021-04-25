//
//  ContentView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    let sections = RowModel.sections
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { section in
                    if let headerModel = section.headerModel {
                        Section(header: contentRow(headerModel)) {
                            if let rowModels = section.rowModels {
                                contentRows(rowModels)
                            }
                        }
                        .textCase(nil)
                    } else if let rowModels = section.rowModels {
                        contentRows(rowModels)
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
    
    private func contentRow(_ rowModel: RowModel) -> some View {
        ContentRowBuilder()
            .withModel(rowModel)
            .build()
    }
    
    private func contentRows(_ rowModels: [RowModel]) -> some View {
        ForEach(rowModels) { model in
            contentRow(model)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
