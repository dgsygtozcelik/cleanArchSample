//
//  ProductsViewModel.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation
import Combine


enum ProductFilterType{
    
    case all
    case available
    case fav
}

class ProductsViewModel: ObservableObject {
    
    // MARK: Private
    
    @Published
    private(set) var state: ViewState<ProductsViewObject> = .idle
    
    // MARK: Private
    
    private var cancellable: AnyCancellable?
    private var getProductsUseCase: GetProductsUseCase
    private var viewObject = ProductsViewObject(headerTitle: "", headerDescription: "", products: [])
    
    // MARK: Init
    
    init(getProductsUseCase: GetProductsUseCase) {
        self.getProductsUseCase = getProductsUseCase
    }
     
    func load() {
        
        self.cancellable = self.getProductsUseCase.execute()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.state = .loading
            })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state = .error(error)
                }
            } receiveValue: { [weak self] viewObject in
                self?.viewObject = viewObject
                self?.state = .loaded(viewObject)
            }
    }
    
    func filter(_ type: ProductFilterType) {
        
        self.state = .loading
        
        switch type {
        case .all:
            let filteredObject = self.viewObject
            self.state = .loaded(filteredObject)
            
        case .available:
            let filteredObject = ProductsViewObject(headerTitle: self.viewObject.headerTitle,
                                                    headerDescription: self.viewObject.headerDescription,
                                                    products: self.viewObject.products.filter({ $0.available }) )
            self.state = .loaded(filteredObject)
            
        case .fav:
            let filteredObject = ProductsViewObject(headerTitle: self.viewObject.headerTitle,
                                                    headerDescription: self.viewObject.headerDescription,
                                                    products: [] )
            self.state = .loaded(filteredObject)
        }
    }
    
}

// MARK: Mock Data & Configuarations

extension ProductsViewModel: Configurator {
    
    static func mock() -> ProductsViewModel {
        ProductsViewModel(getProductsUseCase:
                            GetProductsUseCase(repository:
                                                ProductsRepositoryImplementation(datasource:
                                                                                    ProductsDataSourceImplementation(networkService:
                                                                                                                        DefaultNetworkService())
                                                                                )
                            )
        )
    }

    static func configure(_ param: Void) -> ProductsViewModel {
        ProductsViewModel(getProductsUseCase:
                            GetProductsUseCase(repository:
                                                ProductsRepositoryImplementation(datasource:
                                                                                    ProductsDataSourceImplementation(networkService:
                                                                                                                        DefaultNetworkService())
                                                                                )
                            )
        )
    }
}
