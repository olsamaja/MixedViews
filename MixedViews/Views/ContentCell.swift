//
//  ContentCell.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

public struct ContentCell {
    
    let type: Any
    let model: Any?
    let destination: AnyView?
    
    init(type: Any, model: Any? = nil, destination: AnyView? = nil) {
        self.type = type
        self.model = model
        self.destination = destination
    }
}

public struct ContentSection {
    
    let header: ContentCell?
    let cells: [ContentCell]?
    
    init(header: ContentCell? = nil, cells: [ContentCell]? = nil) {
        self.header = header
        self.cells = cells
    }
}

public class ContentCellBuilder: BuilderProtocol {
    
    private var cell: ContentCell?

    public func withItem(_ cell: ContentCell) -> ContentCellBuilder {
        self.cell = cell
        return self
    }
    
    @ViewBuilder
    public func build() -> some View {
        if let destination = cell?.destination {
            ZStack {
                contentView
                NavigationLink(destination: destination) {
                    EmptyView()
                }.buttonStyle(PlainButtonStyle())
            }
        } else {
            contentView
        }
    }
    
    private var contentView: some View {
        guard let cell = cell else {
            return AnyView(EmptyView())
        }
        switch cell.type.self {
        case is CardView.Type:
            return AnyView( CardView() )
        case is TransactionsSectionView.Type:
            return AnyView( TransactionsSectionView(title: "20th May, 2021") )
        case is ActionView.Type:
            return AnyView( ActionView(title: "Show More") )
        case is BalanceView.Type:
            guard let model = cell.model as? BalanceModel else {
                return AnyView(EmptyView())
            }
            return AnyView( BalanceView(model: model) )
        case is BannersView.Type:
            guard let models = cell.model as? [BannerModel] else {
                return AnyView(EmptyView())
            }
            return AnyView(
                BannersViewBuilder()
                    .withModels(models)
                    .build()
            )
        case is TransactionView.Type:
            guard let model = cell.model as? TransactionModel else {
                return AnyView(EmptyView())
            }
            return AnyView(TransactionView(model: model))
        default: return AnyView(EmptyView())
        }
    }
}
