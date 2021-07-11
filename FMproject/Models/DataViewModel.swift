//
//  DataViewModel.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import Foundation

struct DataViewModel {
    
    private let data: DataModel
    
    init(data: DataModel) {
        self.data = data
    }

    var title: String {
        return data.title
    }
    
    var description: String {
        let textComponents = data.description.components(separatedBy: "http")
        return textComponents.first ?? ""
    }
    
    var modificationDate: String {
        return "Modified: " + data.modificationDate
    }

    var imageUrl: String {
        return data.imageUrl
    }
    
    var pageUrl: String {
        return String(data.description.dropFirst(description.count))
    }
}
