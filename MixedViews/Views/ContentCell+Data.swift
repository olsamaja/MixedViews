//
//  ContentCell+Data.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

extension ContentCell {
    
    enum Constants {
        static let card = ContentCell(type: CardView.self)
        static let transSection = ContentCell(type: TransactionsSectionView.self)
        static let transaction = ContentCell(type: TransactionView.self,
                                             model: TransactionModel(title: "Some transaction", subTitle: "Tap to present details", amount: "£12.95"))
        static let transDetail = ContentCell(type: TransactionView.self,
                                             model: TransactionModel(title: "Another transaction", subTitle: "Transaction with no details", amount: "£1,2345.00"),
                                             destination: AnyView(TransactionDetailsView(model: TransactionModel(title: "Title 3", subTitle: "Sub title", amount: "£12.95"))))
        static let balance = ContentCell(type: BalanceView.self,
                                         model: BalanceModel(spent: "£1,2345.00", available: "£2,550.00", creditLimit: "£4,000.00"))
        static let banners = ContentCell(type: BannersView.self,
                                         model: [
                                              BannerModel(title: "Tap here 1!", subTitle: "Sub title 1"),
                                              BannerModel(title: "Tap here 2!", subTitle: "Sub title 2")
                                              ])
        static let moreAction = ContentCell(type: ActionView.self)
    }
    
    static var sections = [
        ContentSection(cells: [Constants.card]),
        ContentSection(header: Constants.balance,
                       cells: [Constants.banners]),
        ContentSection(header: Constants.transSection,
                       cells: [
                            Constants.transDetail,
                            Constants.transDetail,
                            Constants.transDetail,
                            Constants.transDetail,
                            Constants.transDetail
                       ]),
        ContentSection(header: Constants.transSection,
                       cells: [
                            Constants.transaction,
                            Constants.transaction,
                            Constants.transaction,
                            Constants.transaction
                       ]),
        ContentSection(cells: [Constants.moreAction])
    ]
    
}
