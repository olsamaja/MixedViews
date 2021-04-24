//
//  ContentRow.swift
//  MixedViews
//
//  Created by Olivier Rigault on 25/04/2021.
//

import SwiftUI

struct ContentRow: View {

    let rowModel: RowModel
    
    init(model: RowModel) {
        self.rowModel = model
    }

    var body: some View {
        ContentRow.makeRowView(rowModel: rowModel)
    }
    
    static private func makeRowView(rowModel: RowModel) -> some View {
        switch rowModel.type.self {
        case is CardView.Type:
            return AnyView( CardView() )
        case is TransactionsSectionView.Type:
            return AnyView( TransactionsSectionView(title: "20th May, 2021") )
        case is ActionView.Type:
            return AnyView( ActionView(title: "Show More") )
        case is BalanceView.Type:
            guard let model = rowModel.model as? BalanceModel else {
                return AnyView(EmptyView())
            }
            return AnyView( BalanceView(model: model) )
        case is BannersView.Type:
            guard let models = rowModel.model as? [BannerModel] else {
                return AnyView(EmptyView())
            }
            return AnyView(
                BannersViewBuilder()
                    .withModels(models)
                    .build()
            )
        case is TransactionView.Type:
            guard let model = rowModel.model as? TransactionModel else {
                return AnyView(EmptyView())
            }
            return AnyView(TransactionView(model: model))
        default: return AnyView(EmptyView())
        }
    }
}

public class ContentRowBuilder: BuilderProtocol {
    
    private var rowModel: RowModel?

    public func withModel(_ rowModel: RowModel) -> ContentRowBuilder {
        self.rowModel = rowModel
        return self
    }
    
    @ViewBuilder
    public func build() -> some View {
        if let rowModel = rowModel {
            if let destination = rowModel.destination {
                ZStack {
                    ContentRow(model: rowModel)
                    NavigationLink(destination: destination) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle())
                }
            } else {
                ContentRow(model: rowModel)
            }
        } else {
            AnyView(EmptyView())
        }
    }
}
