//
//  TriviaRepositoryProtocol.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import Foundation

protocol TriviaRepositoryProtocol {
    func getTriviaQuestions() throws -> [TriviaQuestion]
}
