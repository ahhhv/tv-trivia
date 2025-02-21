//
//  TriviaQuestionType.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import Foundation

// Enum para los tipos de preguntas
enum TriviaQuestionType: String, Codable, Hashable {
    case multipleChoice = "multiple_choice"
    case quote = "quote"
    case image = "image"
}

// Modelo de Pregunta
struct TriviaQuestion: Codable, Identifiable {
    let id: Int
    let type: TriviaQuestionType
    let question: String
    let options: [String]
    let correct: String
    let category: String
    let difficulty: String
    
    // Propiedades opcionales para tipos específicos de preguntas
    let quote: String?
    let imageURL: String?
    
    var isAnswered = false
    
    enum CodingKeys: CodingKey {
        case id
        case type
        case question
        case options
        case correct
        case category
        case difficulty
        case quote
        case imageURL
    }
}

struct Player {
    var id: UUID = UUID()
    var username: String = ""
    var score: Int = .zero
    var lives: Int = Constants.livesCount
}
