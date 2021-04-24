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
                ForEach(0..<sections.count) { index in
                    if let headerModel = sections[index].headerModel {
                        Section(header: contentRow(headerModel)) {
                            if let rowModels = sections[index].rowModels {
                                contentRows(rowModels)
                            }
                        }
                        .textCase(nil)
                    } else if let rowModels = sections[index].rowModels {
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
    
    private func contentRows(_ rowsModels: [RowModel]) -> some View {
        ForEach(0..<rowsModels.count) { index in
            contentRow(rowsModels[index])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
