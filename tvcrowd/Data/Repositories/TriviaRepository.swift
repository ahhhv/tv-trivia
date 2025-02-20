//
//  TriviaRepository.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import Foundation

class TriviaRepository: TriviaRepositoryProtocol {
    private let localDataSource: TriviaDataSourceProtocol

    init(localDataSource: TriviaDataSourceProtocol = TriviaLocalDataSource()) {
        self.localDataSource = localDataSource
    }

    func getTriviaQuestions() throws -> [TriviaQuestion] {
        return try localDataSource.fetchQuestions()
    }
}
