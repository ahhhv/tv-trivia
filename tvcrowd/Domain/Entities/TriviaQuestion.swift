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
class TriviaQuestion: Codable, Identifiable, ObservableObject {
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
    
    @Published var isAnswered = false
    
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
    
    init(id: Int, type: TriviaQuestionType, question: String, options: [String], correct: String, category: String, difficulty: String, quote: String?, imageURL: String?, isAnswered: Bool = false) {
        self.id = id
        self.type = type
        self.question = question
        self.options = options
        self.correct = correct
        self.category = category
        self.difficulty = difficulty
        self.quote = quote
        self.imageURL = imageURL
        self.isAnswered = isAnswered
    }
}

struct Player {
    var id: UUID = UUID()
    var username: String = ""
    var score: Int = .zero
    var lives: Int = Constants.livesCount
}
