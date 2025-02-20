//
//  TriviaDataSourceProtocol.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import Foundation

protocol TriviaDataSourceProtocol {
    func fetchQuestions() throws -> [TriviaQuestion]
}
