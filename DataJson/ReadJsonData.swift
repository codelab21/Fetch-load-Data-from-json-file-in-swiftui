//
//  ReadJsonData.swift
//  DataJson
//
//  Created by Eymen on 12.07.2023.
//

import Foundation


struct User: Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case name
        case job
        case email
    }
    
    var id = UUID()
    var name: String
    var job: String
    var email: String
}


class ReadJsonData: ObservableObject {
    @Published var users = [User]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json")
            else {
                print("json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        
        self.users = users!
    }
}
