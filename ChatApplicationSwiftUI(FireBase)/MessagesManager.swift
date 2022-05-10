//
//  MessagesManager.swift
//  ChatApplicationSwiftUI(FireBase)
//
//  Created by Ömer Faruk Kılıçaslan on 10.05.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var lastMessageId = ""
    
    @Published private(set) var messages : [Message] = []
    
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch  {
                    print("Error decoding document into message : \(error)")
                    return nil
                }
            }
            
            self.messages.sorted { $0.timestamp < $1.timestamp}
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
                
            }
                
            
        }
    }
    
    func sendMessage(text:String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error : \(error)")
        }
    }
    
}
