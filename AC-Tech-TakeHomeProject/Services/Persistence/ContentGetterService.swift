//
//  ContentGetterService.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/17/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

enum ContentType: String {
    case transactions = "transactions"
    case payments = "payments"
    case transactionDetails = "transactionDetails"
    case paymentDetails = "paymentDetails"
}

protocol ContentGetterService {
    func getListOfContents(for contentType: ContentType) -> [Dictionary<String, Any>]
    func getContent(for contentType: ContentType, at index: Int) -> Dictionary<String, Any>
}

final class DefaultContentGetterService: ContentGetterService {
    
    private let keychainService: KeychainService
    
    init(keychainService: KeychainService) {
        self.keychainService = keychainService
    }

    func getContent(for contentType: ContentType, at index: Int) -> Dictionary<String, Any> {
        if let path = Bundle.main.path(forResource: getUsername(), ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if let dictionaryResult = jsonResult as? Dictionary<String, AnyObject>,
                    let results = dictionaryResult[contentType.rawValue]?.object(at: index) as? Dictionary<String, Any> {
                    return results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        return [:]
    }
    
    func getListOfContents(for contentType: ContentType) -> [Dictionary<String, Any>] {
        if let path = Bundle.main.path(forResource: getUsername(), ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if let dictionaryResult = jsonResult as? Dictionary<String, AnyObject>,
                    let contentTypes = dictionaryResult[contentType.rawValue] as? [Any],
                    let results = dictionaryResult[contentType.rawValue]?.objects(at: IndexSet(integersIn: 0...contentTypes.count-1)) as? [Dictionary<String, Any>] {
                    return results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        return []
    }
    
    // MARK: - Private methods
    private func getUsername() -> String {
        let credentials = keychainService.fetchLoginData()
        return credentials.username ?? ""
    }
}
