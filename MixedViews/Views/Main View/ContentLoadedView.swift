//
//  ContentLoadedView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 28/04/2021.
//

import SwiftUI

struct ContentLoadedView: View {
    
    let sections: [SectionModel]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                ForEach(0..<sections.count) { sectionIndex in
                    if let sectionModel = sections[sectionIndex].headerModel {
                        Section(header: ContentRow(model: sectionModel)) {
                            contentRows(models: sections[sectionIndex].rowModels)
                        }
                    } else {
                        contentRows(models: sections[sectionIndex].rowModels)
                    }
                }
            }
        }
        .background(Color.defaultBackround)
    }
    
    @ViewBuilder
    private func contentRows(models: [RowModel]?) -> some View {
        if let models = models {
            ForEach(0..<models.count) { rowIndex in
                ContentRow(model: models[rowIndex])
            }
        }
    }
}

struct ContentLoadedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentLoadedView(sections: RowModel.sections)
    }
}
