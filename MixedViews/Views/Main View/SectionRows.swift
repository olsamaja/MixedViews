//
//  SectionRows.swift
//  MixedViews
//
//  Created by Olivier Rigault on 26/04/2021.
//

import SwiftUI

struct SectionRows: View {
    
    let sectionModel: SectionModel
    
    var body: some View {
        if let headerModel = sectionModel.headerModel {
            Section(header: contentRow(headerModel)) {
                if let rowModels = sectionModel.rowModels {
                    contentRows(rowModels)
                }
            }
            .textCase(nil)
        } else if let rowModels = sectionModel.rowModels {
            contentRows(rowModels)
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

struct SectionRows_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SectionRows(sectionModel: SectionModel())
                .previewDisplayName("No sections, nor rows")
            SectionRows(sectionModel:
                            SectionModel(header: RowModel(type: TransactionsSectionView.self)))
                .sizeThatFitPreview(with: "Section header, no rows")
            SectionRows(sectionModel:
                            SectionModel(rows: [
                                RowModel(type: TransactionView.self,
                                                         model: TransactionModel(title: "Title", subTitle: "Subtitle", amount: "£1.00")),
                                RowModel(type: TransactionView.self,
                                             model: TransactionModel(title: "Title", subTitle: "Subtitle", amount: "£2.00"))
                            ]))
                .sizeThatFitPreview(with: "Rows, no section header")
            SectionRows(sectionModel:
                            SectionModel(header: RowModel(type: TransactionsSectionView.self),
                                         rows: [
                                RowModel(type: TransactionView.self,
                                                         model: TransactionModel(title: "Title", subTitle: "Subtitle", amount: "£1.00")),
                                RowModel(type: TransactionView.self,
                                             model: TransactionModel(title: "Title", subTitle: "Subtitle", amount: "£2.00"))
                            ]))
                .sizeThatFitPreview(with: "Section header and rows")
        }
    }
}
