//
//  MainPageViewModel.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import Foundation

final class MainPageViewModel {
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    var data: [DataViewModel] {
        return dataService.data
            .sorted { $0.orderId < $01.orderId }
            .map { DataViewModel(data: $0) }
    }
}
