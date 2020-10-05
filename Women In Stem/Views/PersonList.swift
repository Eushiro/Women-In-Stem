//
//  PeopleList.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-04.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

//List that appears on Primary button click
struct PersonList: View {
    @ObservedObject var peopleViewModel = PeopleViewModel()
    var descriptor: Descriptor
    var body: some View {
            List() {
                ForEach(peopleViewModel.people.filter {$0.descriptors.contains(descriptor)} ) { person in
                    NavigationLink(destination: DescriptionView(person: person)) {
                        Text(person.name)
                    }
                }
            }
            .navigationBarTitle(descriptor.rawValue.capitalized)
    }
}
