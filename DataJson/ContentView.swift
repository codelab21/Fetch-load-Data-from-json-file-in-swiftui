//
//  ContentView.swift
//  DataJson
//
//  Created by Eymen on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = ReadJsonData()
    
    var body: some View {
        NavigationView {
            VStack {
                List(data.users) { info in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(info.name)
                                .font(.title)
                            Text(info.job)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        Text(info.email)
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
