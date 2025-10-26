//
//  URLSession.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import Foundation

extension URLSession{
    
    enum CustomError: Error{
        case invalidResponse
        case invalidRequest
        case invalidUrl
        case invalidData
    }
    
    func getRequest<T: Codable>(url: URL?, model: T.Type, completion: @escaping (Result<T, Error>) -> Void){

        guard let endpoint = url else {
            DispatchQueue.main.async {
                completion(.failure(CustomError.invalidUrl))
            }
            return
        }

        let task = self.dataTask(with: endpoint){ data, _, error in

            guard let guardedData = data else{
                if let error = error{
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }else{
                    DispatchQueue.main.async {
                        completion(.failure(CustomError.invalidData))
                    }
                }
                return
            }

            do{
                let resultData = try JSONDecoder().decode(model, from: guardedData)
                DispatchQueue.main.async {
                    completion(.success(resultData))
                }
            }
            catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }


        }

        task.resume()
    }
}
