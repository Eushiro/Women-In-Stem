//
//  ContentView.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-04-30.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

let blueGradient = LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("LightBlue")]), startPoint: .bottom, endPoint: .top)
let greenGradient = LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .bottom, endPoint: .top)


//Generic button for Home page, green gradient
struct PrimaryButton: View {
    let descriptor: Descriptor
    let width: CGFloat
    let height: CGFloat
    var color: Image?
    let foregroundColor = Color.white
    var body: some View {
        NavigationLink(destination: ListView(descriptor: descriptor)) {
            VStack {
                Spacer()
                Image(descriptor.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(foregroundColor)
                    .padding()
                Spacer()
                Text(descriptor.rawValue.capitalized)
                    .foregroundColor(foregroundColor)
                    .fontWeight(.semibold)
                    .padding()
                    .font(.system(size: 19))
            }
            .frame(width: width, height: height)
        }
        .border(foregroundColor, width: 0.3)
        .background(color?.resizable())
    }
}

struct GameButton: View {
    let text: String
    let width: CGFloat
    let height: CGFloat
    var color: Image?
    let foregroundColor = Color.white
    let gameSession: GameSession
    var body: some View {
        Button(action: {
            if !self.gameSession.checkGameOver() {
                self.gameSession.questionNumber += 1
            }
            if self.gameSession.validateAnswer(answer: self.text) {
                self.gameSession.correctAnswers += 1
            }
            self.gameSession.getNextQuestion()
        }) {
            Text(text)
                .foregroundColor(foregroundColor)
                .fontWeight(.semibold)
                .padding()
                .font(.system(size: 30))
                .frame(width: width, height: height)
        }
        .border(foregroundColor, width: 0.3)
        .background(color?.resizable())
    }
}

//List that appears on primary button click
struct ListView: View {
    var descriptor: Descriptor
    var body: some View {
            List() {
                ForEach(getListValues(buttonType: descriptor)) { person in
                    NavigationLink(destination: DescriptionView(person: person)) {
                        Text(person.name)
                    }
                }
            }
            .navigationBarTitle(descriptor.rawValue.capitalized)
    }
}

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

//Home view, landing page of app
struct HomeView: View {
    let buttonSpacing = CGFloat(0.1)
    let backgroundColor = Image("waterGreen")
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
        }
    }
}

//People View, accessed from tab bar item
struct PeopleView: View {
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

//Games view
struct GamesView: View {
    let buttonSpacing = CGFloat(0.1)
    let backgroundColor = Image("waterBlue")
    @ObservedObject var game = GameSession()
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: self.buttonSpacing) {
                    Divider()
                    HStack {
                        Text("Score: " + String(self.game.correctAnswers))
                            .padding()
                            .font(.system(size: 20))
                        Spacer()
                        Text("Question: " + String(self.game.questionNumber) + "/" + String(self.game.totalQuestions))
                            .padding()
                            .font(.system(size: 20))
                    }
                    Spacer()
                    Text(self.game.currentQuestion.question)
                        .padding()
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack(spacing: self.buttonSpacing) {
                        GameButton(text: self.game.currentQuestion.options[0] , width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                        
                        GameButton(text: self.game.currentQuestion.options[1] , width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                    }
                    
                    HStack(spacing: self.buttonSpacing) {
                        GameButton(text: self.game.currentQuestion.options[2] , width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                        
                        GameButton(text: self.game.currentQuestion.options[3] , width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                    }
                }
                .navigationBarTitle("Trivia")
            }
        }
    }
}

//Entire App
struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "book")
                Text("Fields")
            }
            
            //People
            PeopleView()
            .tabItem {
                Image("woman")
                Text("Background")
            }
            
            //Games view
            GamesView()
            .tabItem {
                Image(systemName: "gamecontroller")
                Text("Quiz")
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
