//
//  APIAccess.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 06/11/20.
//

import Foundation

struct APIAccess {
    
    var id: Int?
    let urlString = "https://my-json-server.typicode.com/Galihasmarandaru/Email-Dummy/Data"
    
    func getEmail(completion: @escaping(Result<[Email], EmailError>) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let emailsResponse = try decoder.decode([Email].self, from: jsonData)
                completion(.success(emailsResponse))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        
        dataTask.resume()
    }
    
    func deleteEmail(completion: @escaping(Result<[Email], EmailError>) -> Void) {
        guard let url = URL(string: urlString + "/\(id!)") else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let emailsResponse = try decoder.decode([Email].self, from: jsonData)
                completion(.success(emailsResponse))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        
        dataTask.resume()
    }
}
