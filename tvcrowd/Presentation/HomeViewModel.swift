//
//  HomeViewModel.swift
//  tvcrowd
//
//  Created by Alex Hernández on 19/2/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var questions: [TriviaQuestion] = []

    private var useCaseTrivia: TriviaUseCaseProtocol
        
    init(useCaseTrivia: TriviaUseCaseProtocol = TriviaUseCase()) {
        self.useCaseTrivia = useCaseTrivia
    }
    
    func classicTrivia() -> [TriviaQuestion] {
        do {
            return try useCaseTrivia.fetchClassicTrivia()
        } catch {
            return []
        }
    }
    
    func quotesTrivia() -> [TriviaQuestion] {
        do {
            return try useCaseTrivia.fetchQuotesTrivia()
        } catch {
            return []
        }
    }
    
    func navigateToResult() -> Bool {
        return questions.allSatisfy { $0.isAnswered }
    }
    
    func selectQuestion() -> TriviaQuestion? {
        return questions.first(where: {$0.isAnswered == false }) ?? nil
    }
    
    func filterQuestion(by type: TriviaQuestionType) {
        switch type {
            
        case .multipleChoice:
            questions = classicTrivia()
        case .quote:
            questions = quotesTrivia()
        case .image:
            break
        }
    }
}



struct GameButtonInfo: Identifiable {
    var id: UUID = UUID()
    var title: String
    var icon: String
    var type: TriviaQuestionType
}
