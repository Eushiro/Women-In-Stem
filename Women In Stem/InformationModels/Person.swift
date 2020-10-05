//
//  Person.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-02.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseFirestoreSwift

enum Descriptor: String, Codable {
    case SCIENCE = "science"
    case TECHNOLOGY = "technology"
    case ENGINEERING = "engineering"
    case MATH = "math"
    case PHYSICS = "physics"
    case CHEMISTRY = "chemistry"
    case BIOLOGY = "biology"
    case BLACK = "black women"
    case ASIAN = "asian women"
    case INDIGENOUS = "indigenous women"
    case LATINA = "latina women"
    case LOW_INCOME = "low income"
    case IMMIGRANTS = "immigrant"
    case DISABILITY = "disability"
}

struct Person: Identifiable, Codable {
    let name: String
    let descriptors: [Descriptor]
    let text: String
    let references: [String]
    let link: String
    var id = UUID()
    
    private enum CodingKeys: String, CodingKey {
        case name, descriptors, text, references, link
    }
}

class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    init() {
        getPeopleFromDB()
    }
    
    func getPeopleFromDB() {
        let db = Firestore.firestore()
        let peopleDB = db.collection("people")
        peopleDB.getDocuments { (snap, error) in
            if let error = error {
                print("Error getting documents \(error)")
            } else if let snap = snap {
                self.people = snap.documents.compactMap {
                    return try? $0.data(as: Person.self)
                }
            }
        }
    }
}
