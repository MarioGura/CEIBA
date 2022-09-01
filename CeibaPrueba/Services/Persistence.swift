//
//  Persistence.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import Foundation

protocol UserPersistence {
    func saveUser(userModel: UserPersistenceUserDefault.RequestUserModel) -> Bool
    func getUsers() -> [ResponseUser]
}

class UserPersistenceUserDefault: UserPersistence {
    
    struct RequestUserModel {
        let id: Int
        let name: String
        let email: String
        let address: Address
        let phone: String
        let website: String
        let company: Company
    }

    let userDefaults = UserDefaults.standard
    let keyUserToSave = "userHistoryArray"

    //MARK: UserPersistence
    func saveUser(userModel: RequestUserModel) -> Bool {
        var users = getUsers()
        users.append(ResponseUser(id: userModel.id,
                                  name: userModel.name,
                                  email: userModel.email,
                                  address: userModel.address,
                                  phone: userModel.phone,
                                  website: userModel.website,
                                  company: userModel.company))
        do {
            let usersData = try JSONEncoder().encode(users)
            userDefaults.set(usersData, forKey: keyUserToSave)
            return true
        } catch {
            print(error.localizedDescription)
            return true
        }
    }

    func getUsers() -> [ResponseUser] {
        guard let data = userDefaults.data(forKey: keyUserToSave),
              let users = try? JSONDecoder().decode([ResponseUser].self, from: data) else { return [] }

        return users
    }
}
