//
//  Background.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-04.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

//People View, accessed from tab bar item
struct BackgroundView: View {
    let buttonSpacing = CGFloat(0.1)
    let backgroundColor = Image("waterBlue")
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: self.buttonSpacing) {
                    Divider()
                    HStack(spacing: self.buttonSpacing) {
                        PrimaryButton(descriptor: Descriptor.BLACK, width: geometry.size.width/2, height: geometry.size.height/3,
                                      color: self.backgroundColor)
                        
                        PrimaryButton(descriptor: Descriptor.ASIAN, width: geometry.size.width/2, height: geometry.size.height/3,
                                      color: self.backgroundColor)
                    }
                    
                    HStack(spacing: self.buttonSpacing) {
                        PrimaryButton(descriptor: Descriptor.INDIGENOUS, width: geometry.size.width/2, height: geometry.size.height/3,
                                      color: self.backgroundColor)
                        
                        PrimaryButton(descriptor: Descriptor.LATINA, width: geometry.size.width/2, height: geometry.size.height/3,
                                      color: self.backgroundColor)
                    }
                    
                    HStack(spacing: self.buttonSpacing) {
                        PrimaryButton(descriptor: Descriptor.LOW_INCOME, width: geometry.size.width/2, height: geometry.size.height/3,
                                      color: self.backgroundColor)
                        
                        PrimaryButton(descriptor: Descriptor.IMMIGRANTS, width: geometry.size.width/2, height: geometry.size.height/3,
                                      color: self.backgroundColor)
                    }
                }
                .navigationBarTitle("Women in STEM")
            }
        }
    }
}
