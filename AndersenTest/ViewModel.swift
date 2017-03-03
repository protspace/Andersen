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
    
}

extension ViewModel {
    
    func getUsers() {
        
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
