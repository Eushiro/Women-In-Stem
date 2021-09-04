//
//  Fields.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-04.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

let greenGradient = LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .bottom, endPoint: .top)

//Home view, landing page of app
struct FieldsView: View {
    let buttonSpacing = CGFloat(0.1)
    let backgroundColor = greenGradient
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: self.buttonSpacing) {
                    Divider()
                    HStack(spacing: self.buttonSpacing) {
                        PrimaryButton(descriptor: Descriptor.CHEMISTRY, width: geometry.size.width/3, height: geometry.size.height/2, color: self.backgroundColor)
                        
                        PrimaryButton(descriptor: Descriptor.PHYSICS, width: geometry.size.width/3, height: geometry.size.height/2, color: self.backgroundColor)
                        
                        PrimaryButton(descriptor: Descriptor.BIOLOGY, width: geometry.size.width/3, height: geometry.size.height/2, color: self.backgroundColor)
                    }
                    
                    HStack(spacing: self.buttonSpacing) {
                        PrimaryButton(descriptor: Descriptor.ENGINEERING, width: geometry.size.width/2, height: geometry.size.height/2,
                                      color: self.backgroundColor)
                        
                        PrimaryButton(descriptor: Descriptor.MATH, width: geometry.size.width/2, height: geometry.size.height/2,
                                      color: self.backgroundColor)
                    }
                }
                .navigationBarTitle("Women in STEM")
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
