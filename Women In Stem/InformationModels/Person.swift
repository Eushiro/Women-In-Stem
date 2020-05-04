//
//  Person.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-02.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import Foundation

enum Descriptor: String {
    case SCIENCE = "science"
    case TECHNOLOGY = "technology"
    case ENGINEERING = "engineering"
    case MATH = "math"
    case PHYSICS = "physics"
    case CHEMISTRY = "chemistry"
    case BIOLOGY = "biology"
    case BLACK = "black women"
    case ASIAN = "asian women"
    case INDIGENOUS = "indigenous women"
    case LATINA = "latina women"
    case LOW_INCOME = "low income"
    case IMMIGRANTS = "immigrant"
    case DISABILITY = "disability"
}

struct Person: Identifiable {
    let name: String
    let descriptors: [Descriptor]
    let text: String
    let references: [String]
    var id = UUID()
}

let people = [
    Person(name: "Chien-Shiung Wu", descriptors: [.PHYSICS, .ASIAN, .IMMIGRANTS, .SCIENCE], text: ChienShiungWu, references: ChienShiungWuReferences),
    Person(name: "Edna Paisano", descriptors: [.MATH, .INDIGENOUS], text: EdnaPaisano, references: EdnaPaisanoReferences),
    Person(name: "Mary G. Ross", descriptors: [.MATH, .ENGINEERING, .INDIGENOUS], text: MaryRoss, references: MaryRossReferences),
    Person(name: "Gertrude B. Elion", descriptors: [.CHEMISTRY, .LOW_INCOME, .IMMIGRANTS], text: GertrudeElion, references: GertrudeElionReferences),
    Person(name: "Gerty Cori", descriptors: [.BIOLOGY, .IMMIGRANTS], text: GertyCori, references: GertyCoriReferences),
    Person(name: "Rita Levi-Montalcini", descriptors: [.BIOLOGY, .IMMIGRANTS], text: RitaLeviMontalcini, references: RitaLeviMontalciniReferences),
    Person(name: "Rupa Bai Furdoonji", descriptors: [.BIOLOGY, .ASIAN], text: RupaFurdoonji, references: RupaFurdoonjiReferences),
    Person(name: "Anandi Gopal Joshi", descriptors: [.BIOLOGY, .ASIAN], text: AnandiGopalJoshi, references: AnandiGopalJoshiReferences),
    Person(name: "Cecilia Helena Payne", descriptors: [.PHYSICS], text: CeciliaPayne, references: CeciliaPayneReferences),
    Person(name: "Annie Jump Cannon", descriptors: [.PHYSICS, .DISABILITY], text: AnnieCannon, references: AnnieCannonReferences),
    Person(name: "Bessie Coleman", descriptors: [.ENGINEERING, .INDIGENOUS, .BLACK], text: BessieColeman, references: BessieColemanReferences),
    Person(name: "Marie Maynard Daly", descriptors: [.CHEMISTRY, .BLACK, .LOW_INCOME], text: MarieDaly, references: MarieDalyReferences),
    Person(name: "Mary Jackson", descriptors: [.MATH, .ENGINEERING, .PHYSICS, .BLACK], text: MaryJackson, references: MaryJacksonReferences),
    Person(name: "Rukhmabai", descriptors: [.BIOLOGY, .ASIAN], text: Rukhmabai, references: RukhmabaiReferences),
    Person(name: "Ynes Mexia", descriptors: [.BIOLOGY, .LATINA], text: YnesMexia, references: YnesMexiaReferences),
    Person(name: "Ruby Hirose", descriptors: [.BIOLOGY, .CHEMISTRY, .ASIAN], text: RubyHirose, references: RubyHiroseReferences),
    Person(name: "Mary Anning", descriptors: [.BIOLOGY, .LOW_INCOME], text: MaryAnning, references: MaryAnningReferences),
    Person(name: "Elizabeth Garrett Anderson", descriptors: [.BIOLOGY], text: ElizabethGarrettAnderson, references: ElizabethGarrettAndersonReferences),
    Person(name: "Dorothy Hodgkin", descriptors: [.CHEMISTRY, .DISABILITY], text: DorothyHodgkin, references: DorothyHodgkinReferences),
    Person(name: "Hedwig Kohn", descriptors: [.PHYSICS, .IMMIGRANTS], text: HedwigKohn, references: HedwigKohnReferences)
]
