//
//  DataService.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import Foundation

protocol DataServiceProtocol: AnyObject {
    func getData(completion: @escaping (Bool) -> ())
}

final class DataService: DataServiceProtocol {
    func getData(completion: @escaping (Bool) -> ()) {
        completion(true)
    }
}
