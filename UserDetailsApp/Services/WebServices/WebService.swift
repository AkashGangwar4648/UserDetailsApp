//
//  WebService.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

// MARK: - IMPLEMENTING WEB SERVICE
class WebService{
    func load<T>(resource:Resource<T>,completion: @escaping(Result<T,NetworkError>)->Void){
        
        // TODO: CHECK INTERNET CONNECTIVITY
        
        
        // TODO: CREATE REQUEST
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        // TODO: CHECK OAUTH
        if resource.OAuth{
          // SENT VALUES IN HEADER...!
        }
        
        
        // TODO: IMPLEMENT URL SESSION
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data,error == nil else{
                print("🚫 ERROR IN LOAD DATA: - \(error)")
                print("🚫 ERROR DESCRIPTION IN LOAD DATA: - \(error?.localizedDescription ?? String())")
                completion(.failure(.domainError))
                return
            }
            
            print("✅ DATA LOAD SUCCESSFULLY...!")
            
            
            do{
                let result = try JSONDecoder().decode(T.self, from: data)
                print("✅ DATA DECODE SUCCESSFULLY...!")
                completion(.success(result))
                
            }catch{
                print("🚫 ERROR IN DECODING DATA: - \(error)")
                print("🚫 ERROR DESCRIPTION IN DECODING DATA: - \(error.localizedDescription)")
                completion(.failure(.decodingError))
            }
            
        }.resume()
    
    }
}
