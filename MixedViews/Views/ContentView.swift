//
//  ContentView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    let sections = ContentCell.sections

    @ViewBuilder
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<sections.count) { index in
                    if let header = sections[index].header {
                        Section(header: contentCellView(header)) {
                            if let cells = sections[index].cells {
                                contentCellViews(cells)
                            }
                        }
                        .textCase(nil)
                    } else if let cells = sections[index].cells {
                        contentCellViews(cells)
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
    
    private func contentCellView(_ cell: ContentCell) -> some View {
        ContentCellBuilder()
            .withItem(cell)
            .build()
    }
    
    private func contentCellViews(_ cells: [ContentCell]) -> some View {
        ForEach(0..<cells.count) { index in
            contentCellView(cells[index])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
