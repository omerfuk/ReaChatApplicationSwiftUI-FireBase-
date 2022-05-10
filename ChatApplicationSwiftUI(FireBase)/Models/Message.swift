//
//  Message.swift
//  ChatApplicationSwiftUI(FireBase)
//
//  Created by Ömer Faruk Kılıçaslan on 10.05.2022.
//

import Foundation

struct Message: Identifiable, Codable {
    
    var id:String
    var text:String
    var received:Bool
    var timestamp:Date
}
