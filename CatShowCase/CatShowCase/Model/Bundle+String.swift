//
//  Bundle+String.swift
//  CatShowCase
//
//  Created by XIN LIU on 2/15/23.
//

import Foundation

extension Bundle {
    func localizedString(forKey key: String) -> String {
        return localizedString(forKey: key, value: nil, table: nil)
    }
}
