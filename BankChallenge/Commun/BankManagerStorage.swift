//
//  BankManagerStorage.swift
//  BankChallenge
//
//  Created by Renan Rocha on 31/05/21.
//

import Foundation
import CoreData
import UIKit

class BankManagerStorage {
    static let shared = BankManagerStorage()
    var users:[String] = []
    
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func loadUser() -> BankStorage? {
        let fetchRequest: NSFetchRequest<BankStorage> = BankStorage.fetchRequest()
        let sortDescritor = NSSortDescriptor(key: "email", ascending: true)
        fetchRequest.sortDescriptors = [sortDescritor]
        
        do {
            let users = try context.fetch(fetchRequest)
            if users.count > 0 {
                return users.first as! BankStorage
            }
            else {
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func insertUser(user: String) -> Bool{
        let userBd :BankStorage = BankStorage(context: context)
        userBd.email = user
        
        do {
            try context.save()
            return true
        } catch {
            print("Error ao gravar: \(error.localizedDescription)")
            return false
        }
        
    }
}
