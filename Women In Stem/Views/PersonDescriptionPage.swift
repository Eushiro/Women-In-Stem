//
//  PersonDescriptionPage.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-04.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI
import URLImage

//Description page that appears on ListView cell click
struct DescriptionView: View {
    var person: Person
    var allReferences: String? {
        get {
            return person.references.map { $0.trimmingCharacters(in: .whitespacesAndNewlines)}
                .joined(separator: "\n\n")
        }
    }
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        URLImage(URL(string: person.link)!) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                        .padding()
                        Spacer()
                    }
                    
                    Text(person.text)
                        .navigationBarTitle(person.name)
                        .padding()
                    
                    Text("References")
                        .bold()
                        .padding()
                        .multilineTextAlignment(.leading)
                    
                    Text(allReferences ?? "")
                        .padding()
                }
            }
        }
    }
}
