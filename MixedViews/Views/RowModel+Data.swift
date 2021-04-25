//
//  RowModel+Data.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

extension RowModel {
    
    enum Constants {
        static let card = RowModel(type: CardView.self)
        static let transSection = RowModel(type: TransactionsSectionView.self)
        static let transaction = RowModel(type: TransactionView.self,
                                          model: TransactionModel(title: "Some merchant",
                                                                  subTitle: "Transaction with no details",
                                                                  amount: "£12.95"))
        static let transactionWithDetails = RowModel(type: TransactionView.self,
                                                     model: TransactionModel(title: "A merchant",
                                                                             subTitle: "Tap to present details",
                                                                             amount: "£1,2345.00"),
                                             destination: AnyView(TransactionDetailsView(
                                                                    model: TransactionModel(title: "A merchant",
                                                                                            subTitle: "Sub title",
                                                                                            amount: "£1,2345.00"))))
        static let balance = RowModel(type: BalanceView.self,
                                      model: BalanceModel(spent: "£1,2345.00",
                                                          available: "£2,550.00",
                                                          creditLimit: "£4,000.00"))
        static let banners = RowModel(type: BannersView.self,
                                      model: [
                                        BannerModel(title: "Tap here 1!", subTitle: "Sub title 1"),
                                        BannerModel(title: "Tap here 2!", subTitle: "Sub title 2"),
                                        BannerModel(title: "Tap here 3!", subTitle: "Sub title 3")
                                              ])
        static let moreAction = RowModel(type: ActionView.self)
    }
    
    static var sections = [
        SectionModel(rows: [Constants.card]),
        SectionModel(header: Constants.balance,
                     rows: [Constants.banners]),
        SectionModel(header: Constants.transSection,
                     rows: [
                        Constants.transactionWithDetails,
                        Constants.transactionWithDetails,
                        Constants.transactionWithDetails,
                        Constants.transactionWithDetails,
                        Constants.transactionWithDetails
                    ]),
        SectionModel(header: Constants.transSection,
                     rows: [
                        Constants.transaction,
                        Constants.transaction,
                        Constants.transaction,
                        Constants.transaction
                    ]),
        SectionModel(rows: [Constants.moreAction])
    ]
}
