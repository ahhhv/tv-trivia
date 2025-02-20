//
//  TriviaQuestionType.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import SwiftUI

struct TriviaView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var question: TriviaQuestion?
    @State private var selectedOption: String? = nil
    @State private var isCorrect: Bool? = nil
    
    var type: TriviaQuestionType?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(question?.question ?? "")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if let imageURL = question?.imageURL, question?.type == .image {
                    Image(imageURL)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                
                if let quote = question?.quote, question?.type == .quote {
                    Text("\"\(quote)\"")
                        .italic()
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                if let options = question?.options {
                    ForEach(options, id: \ .self) { option in
                        Button(action: {
                            guard selectedOption == nil else { return }
                            selectedOption = option
                            isCorrect = option == self.question?.correct
                            if let questionID = self.question?.id,
                               let index = viewModel.questions.firstIndex(where: { $0.id == questionID }) {
                                viewModel.questions[index].isAnswered = true
                            }

                        }) {
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedOption == option ? (isCorrect == true ? Color.green.opacity(0.5) : Color.red.opacity(0.5)) : Color.blue.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .opacity(selectedOption == nil || selectedOption == option ? 1.0 : 0.5)
                        }
                        .disabled(selectedOption != nil)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                
                if selectedOption != nil {
                    NavigationLink {
                        if viewModel.navigateToResult() {
                            ResultView()
                        } else {
                            TriviaView(viewModel: viewModel, type: type)
                        }
                        
                    } label: {
                        HStack {
                            Text(viewModel.navigateToResult() ? "Resultado" : "Siguiente pregunta")
                            
                            Image(systemName: "arrow.right")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
        }
        .onAppear {
            viewModel.filterQuestion(by: type ?? .multipleChoice)
            question = viewModel.selectQuestion()
        }
        .padding()
    }
}

#Preview {
    TriviaView(viewModel: HomeViewModel(), type: .quote)
}
