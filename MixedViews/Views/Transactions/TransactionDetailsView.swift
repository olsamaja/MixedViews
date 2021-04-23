//
//  TransactionDetailsView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct TransactionDetailsView: View {
    
    let title: String
    let subTitle: String
    let amount: String
    
    init(model: TransactionModel) {
        self.title = model.title
        self.subTitle = model.subTitle
        self.amount = model.amount
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.title)
                .padding()
            Text(subTitle)
                .font(.body)
                .padding()
            Text(amount)
                .font(.headline)
                .padding()
            Spacer()
        }
    }
}

struct TransactionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailsView(model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95"))
    }
}
