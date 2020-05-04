//
//  ContentView.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-04-30.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

let fontName = "Helvetica Neue"

//Entire App
struct ContentView: View {
    var body: some View {
        TabView {
            FieldsView()
            .tabItem {
                Image(systemName: "book")
                Text("Fields")
            }
            
            //People
            BackgroundView()
            .tabItem {
                Image("woman")
                Text("Background")
            }
            
            //Games view
            GamesView()
            .tabItem {
                Image(systemName: "gamecontroller")
                Text("Trivia")
            }
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
