//
//  File.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import Foundation
import Alamofire

class GetServices {
    
    private var baseUrl: String
    private var manager: Session
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            return config
        }()
        self.manager = Session(configuration: configuration)
    }
    
    func getUsers(completionHandler: @escaping([ResponseUser]?) -> Void) {
        let endPoint = "/users"
        request(UrlService: endPoint, completionHandler: completionHandler)
    }
    
    func getPosts(id: Int, completionHandler: @escaping([ResponsePosts]?) -> Void) {
        let endPoint = "/posts?userId=\(id)"
        request(UrlService: endPoint, completionHandler: completionHandler)
    }
    
    private func request<T:Codable>(UrlService: String, completionHandler: @escaping(T?) -> Void) {
        manager.request("\(baseUrl)\(UrlService)").validate().responseDecodable(of: T.self) { response in
            guard let data = response.value else { return }
            completionHandler(data)
        }
    }
}
