//
//  ViewModel.swift
//  AndersenTest
//
//  Created by Eugen Sagidulin on 3/3/17.
//  Copyright © 2017 Protspace. All rights reserved.
//
import Foundation
import Unbox

class ViewModel {
    
    var users = [User]()
    var currentUser: User? = nil

    let numberOfSections = 1
    let numberOfRows = 10
}

extension ViewModel {
    
    func loadUsers() {
        
        if let data = loadJson(fileName: "users") {
            do {
                let users: [User] = try unbox(data: data)
                print(users.count)
                self.users = users
            } catch {
                print("An error occured: \(error)")
            }
        }
    }
    
    func loadJson(fileName: String) -> Data? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"), let data = NSData(contentsOfFile: path) as? Data {
            return data
        }
        return nil
        
    }
    
}

extension ViewModel {
    
    func userNameFor(user: User) -> String {
        return user.username
    }
    
    func companyNameFor(user: User) -> String {
        return user.company
    }
    
    func profileTitleFor(row: Int) -> String {
        
        switch row {
        case 0:
            return currentUser?.username ?? ""
        case 1:
            return currentUser?.email ?? ""
        case 2:
            return currentUser?.street ?? ""
        case 3:
            return currentUser?.city ?? ""
        case 4:
            return currentUser?.zipcode ?? ""
        case 5:
            return currentUser?.phone ?? ""
        case 6:
            return currentUser?.website ?? ""
        case 7:
            return currentUser?.company ?? ""
        case 8:
            return currentUser?.about ?? ""
        default:
            return ""
        }
    }

}
