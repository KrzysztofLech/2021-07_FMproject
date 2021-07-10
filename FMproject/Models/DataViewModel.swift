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
        let textArray = data.description.components(separatedBy: "http")
        return textArray.first ?? ""
    }
    
    var modificationDate: String {
        return "Modified: " + data.modificationDate
    }

    var imageUrl: String {
        return data.imageUrl
    }
}
