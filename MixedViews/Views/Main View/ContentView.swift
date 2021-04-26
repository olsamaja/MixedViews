//
//  ContentView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        NavigationView {
            ContainedView(state: viewModel.state)
                .toolbar {
                    Button("Tap") {
                        viewModel.send(event: .onTap)
                    }
                }
                .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: ContentViewModel())
            ContentView(viewModel: ContentViewModel(state: .loading))
            ContentView(viewModel: ContentViewModel(state: .error))
            ContentView(viewModel: ContentViewModel(state: .loaded(RowModel.sections)))
        }
    }
}
