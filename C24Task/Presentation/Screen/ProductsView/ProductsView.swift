//
//  ProductsView.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject
    var viewModel: ProductsViewModel
    
    var body: some View {
        
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle:
                    Color.white
                        .onAppear(perform: viewModel.load)
                case .loading:
                    ProgressView()
                case .loaded(let viewObject):
                    content(viewObject)
                case .error(_):
                    ErrorView(buttonAction: {
                        viewModel.load()
                    })
                }
            }
            .navigationTitle("navigation-title")
        }
    }
    
    @ViewBuilder
    private func content(_ viewObject: ProductsViewObject) -> some View {
        
        VStack(spacing: 12) {
            
            titleView(viewObject)
            
            filterView
            
            listView(viewObject)
            
            footerView
            
            Spacer()
        }.padding()
    }
}

// MARK: Views

private extension ProductsView {
    
    @ViewBuilder
    func titleView(_ viewObject: ProductsViewObject) -> some View {
        
        HStack {
            
            VStack (alignment: .leading) {
                Text(viewObject.headerTitle)
                    .bold()
                Text(viewObject.headerDescription)
            }
            
            Spacer()
        }
        
    }
    
    var filterView: some View {
        
        HStack {
            
            Button(action: {
                self.viewModel.filter(.all)
            }) {
                Text("filter-all")
            }
            
            Spacer()
            
            Button(action: {
                self.viewModel.filter(.available)
            }) {
                Text("filter-available")
            }
            
            Spacer()
            
            Button(action: {
                self.viewModel.filter(.fav)
            }) {
                Text("filter-favorites")
            }
        }
    }
    
    @ViewBuilder
    func listView(_ viewObject: ProductsViewObject) -> some View {
        
        switch viewObject.products.isEmpty {
        case true:
            Text("products-list-empty")
        case false:
            ScrollView() {
                ForEach(viewObject.products, id: \.self) { product in
                    
                    ProductCell(data: product)
                }
            }
        }
    }
    
    var footerView: some View {
        Text("copy-right-text")
    }
}

// MARK: Preview

struct ProductsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductsView(viewModel: .mock())
    }
}
