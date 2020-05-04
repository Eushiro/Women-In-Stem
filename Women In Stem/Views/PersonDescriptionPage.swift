//
//  PersonDescriptionPage.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-04.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

//Description page that appears on ListView cell click
struct DescriptionView: View {
    var person: Person
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text(person.text)
                        .navigationBarTitle(person.name)
                        .padding()
                    
                    Text("References")
                        .bold()
                        .padding()
                        .multilineTextAlignment(.leading)
                    
                    ForEach(person.references, id: \.self) { reference in
                        Text(reference.trimmingCharacters(in: .whitespacesAndNewlines))
                            .padding()
                    }
                }
            }
        }
    }
}
