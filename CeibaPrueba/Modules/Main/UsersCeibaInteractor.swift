//
//  UsersCeibaInteractor.swift
//  CeibaPrueba
//
//  Created JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

class UsersCeibaInteractor: UsersCeibaInteractorInputProtocol {
    weak var presenter: UsersCeibaInteractorOutputProtocol?
    
    private let persistenceUser: UserPersistence = UserPersistenceUserDefault()
    let apiRest = GetServices.init(baseUrl: "https://jsonplaceholder.typicode.com")
    let userDefaults = UserDefaults.standard
    var networtkIsReachable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func fetchUsers() {
        if !networtkIsReachable {
            presenter?.returnNoInternet()
            return
        }
        apiRest.getUsers { (apiObject) in
            self.saveUsers(users: apiObject!)
        }
    }
    
    func fetchPosts(id: Int) {
        if !networtkIsReachable {
            presenter?.returnNoInternet()
            return
        }
        apiRest.getPosts(id: id, completionHandler: { (apiObject) in
            self.presenter?.dataPosts(posts: apiObject!)
        })
    }
    
    func fetchPersistenceData() {
        guard let data = userDefaults.data(forKey: "userHistoryArray"),
              let users = try? JSONDecoder().decode([ResponseUser].self, from: data) else {
                  presenter?.dataIsEmpty()
                  return
              }
        presenter?.dataUsers(users: users)
    }
    
    func saveUsers(users: [ResponseUser]) {
        for user in users {
            _ = persistenceUser.saveUser(userModel: UserPersistenceUserDefault.RequestUserModel(id: user.id,
                                                                                        name: user.name,
                                                                                        email: user.email,
                                                                                        address: user.address,
                                                                                        phone: user.phone,
                                                                                        website: user.website,
                                                                                        company: user.company))
        }
        presenter?.dataSaved()
    }
}
