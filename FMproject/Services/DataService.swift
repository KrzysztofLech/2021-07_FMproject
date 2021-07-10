//
//  DataService.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import Foundation

enum ErrorResult: String, Error {
    case url = "Wrong url format"
    case noInternet = "No Internet"
    case network = "Failed to fetch data"
    case statusCode = "Response Status Code is not OK"
    case other = "Fetched data problem"
    case parse = "Parse data problem"
}

protocol DataServiceProtocol: AnyObject {
    var data: [DataModel] { get set }
    func fetchData(completion: @escaping (Result<[DataModel], ErrorResult>) -> ())
}

final class DataService: DataServiceProtocol {
    
    private let endpoint = "https://recruitment-task.futuremind.dev/recruitment-task"
    
    var data: [DataModel] = []
    
    func fetchData(completion: @escaping (Result<[DataModel], ErrorResult>) -> ()) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(.url))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                if let err = error as? URLError, err.code == .notConnectedToInternet {
                    completion(.failure(.noInternet))
                } else {
                    completion(.failure(.network))
                }
                return
            }

            else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(.statusCode))
                return
            }

            guard let data = data else {
                completion(.failure(.other))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode([DataModel].self, from: data)
                self?.data = responseData
                completion(.success(responseData))
            } catch {
                completion(.failure(.parse))
            }
        }.resume()
    }
}
