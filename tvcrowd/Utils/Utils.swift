//
//  Utils.swift
//  tvcrowd
//
//  Created by Alex Hernández on 20/2/25.
//

import Foundation

enum Constants {
    static let livesCount: Int = 3

    static let gameInfo: [GameButtonInfo] = [
        GameButtonInfo(title: "Modo Clásico", icon: "questionmark.circle", type: .multipleChoice),
        GameButtonInfo(title: "Adivina la Serie (Opening)", icon: "music.note", type: .multipleChoice),
        GameButtonInfo(title: "¿Quién dijo esto?", icon: "bubble.right", type: .quote),
        GameButtonInfo(title: "Imagen Misteriosa", icon: "photo", type: .image),
        GameButtonInfo(title: "Modo Supervivencia", icon: "flame.fill", type: .multipleChoice),
        GameButtonInfo(title: "Personaliza tu Trivia", icon: "slider.horizontal.3", type: .multipleChoice),
    ]
}
