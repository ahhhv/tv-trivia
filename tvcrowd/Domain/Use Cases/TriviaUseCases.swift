//
//  TriviaUseCases.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import Foundation

protocol TriviaUseCaseProtocol {
    func fetchClassicTrivia() throws -> [TriviaQuestion]
    func fetchQuotesTrivia() throws -> [TriviaQuestion]
}

class TriviaUseCase: TriviaUseCaseProtocol {
    var triviaRepository: TriviaRepositoryProtocol
    
    init(triviaRepository: TriviaRepositoryProtocol = TriviaRepository()) {
        self.triviaRepository = triviaRepository
    }
    
    func fetchClassicTrivia() throws -> [TriviaQuestion] {
        return try triviaRepository.getTriviaQuestions()
            .filter { $0.type == .multipleChoice }
            .shuffled()
            .prefix(10)
            .map { $0 }
    }
    
    func fetchQuotesTrivia() throws -> [TriviaQuestion] {
        return try triviaRepository.getTriviaQuestions()
            .filter { $0.type == .quote }
            .shuffled()
            .prefix(10)
            .map { $0 }
    }
}
