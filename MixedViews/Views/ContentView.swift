//
//  ContentView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    let items = [
        ContentCell(type: CardView.self, destination: AnyView(CardView())),
        ContentCell(type: BannersView.self,
                    model: [
                        BannerModel(title: "Tap here 1!", subTitle: "Sub title 1"),
                        BannerModel(title: "Tap here 2!", subTitle: "Sub title 2")
                        ]),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title 3", subTitle: "Sub title", amount: "£12.95"),
                    destination: AnyView(TransactionDetailsView(model: TransactionModel(title: "Title 3", subTitle: "Sub title", amount: "£12.95")))),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title 4", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title 5", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title 6", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95")),
        ContentCell(type: TransactionView.self,
                    model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95"))
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<items.count) { index in
                    ContentCellBuilder()
                        .withItem(items[index])
                        .build()
                }
            }
            .navigationTitle("Home")
        }
    }
}

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

public class ContentCellBuilder: BuilderProtocol {
    
    private var cell: ContentCell?

    public func withItem(_ cell: ContentCell) -> ContentCellBuilder {
        self.cell = cell
        return self
    }
    
    @ViewBuilder
    public func build() -> some View {
        if let destination = cell?.destination {
            NavigationLink(destination: destination) {
                contentView
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
        case is CardView.Type: return AnyView( CardView() )
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
