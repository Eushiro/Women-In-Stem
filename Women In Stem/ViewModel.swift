//
//  ViewModel.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-02.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import Foundation


func getListValues(buttonType: Descriptor) -> [Person] {
    return people.filter { $0.descriptors.contains(buttonType) }
}
