//
//  TransactionsSectionView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct TransactionsSectionView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            Text(title)
                .bold()
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            Spacer()
        }
        .listRowInsets(EdgeInsets())
        .background(Color.defaultBackround)
    }
}

struct TransactionsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsSectionView(title: "Title")
    }
}
