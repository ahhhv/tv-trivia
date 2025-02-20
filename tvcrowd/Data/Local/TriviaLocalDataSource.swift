//
//  TriviaLocalDataSource.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import Foundation

class TriviaLocalDataSource: TriviaDataSourceProtocol {
    func fetchQuestions() throws -> [TriviaQuestion] {
        guard let url = Bundle.main.url(forResource: "trivia_questions", withExtension: "json") else {
            throw NSError(domain: "TriviaError",
                          code: 404,
                          userInfo: [NSLocalizedDescriptionKey: "Archivo JSON no encontrado"])
        }
        
        let data = try Data(contentsOf: url)
        let questions = try JSONDecoder().decode([TriviaQuestion].self, from: data)
        return questions
    }
}
