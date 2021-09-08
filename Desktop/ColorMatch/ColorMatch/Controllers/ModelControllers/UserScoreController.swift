//
//  UserScoreController.swift
//  ColorMatch
//
//  Created by Trevor Bursach on 8/18/21.
//

import Foundation

class UserScoreController {
    
    static let shared = UserScoreController()
    
    var scores: [UserScore] = []
    
    
    // MARK: - CRUD Functions
    
    func createScore(name: String, score: Int) {
        let newScore = UserScore(name: name, score: score)
        var placeholderScores = scores
        placeholderScores.append(newScore)
        //Sorts the array of UserScores by highest score.
        placeholderScores = placeholderScores.sorted { $0.score < $1.score }
        //This gives the top five highest scores
        scores = placeholderScores
        
        //local persistence With Core Data?
        
    }
    
    //MARK: - Persistence
    
    func createFileForPersistence() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileUrl = urls[0].appendingPathComponent("colorMatch.json")
        return fileUrl
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        do {
            let jsondScores = try jsonEncoder.encode(scores)
            try jsondScores.write(to: createFileForPersistence())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    func load() {
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonData = try Data(contentsOf: createFileForPersistence())
            let decodedScores = try jsonDecoder.decode([UserScore].self, from: jsonData)
            scores = decodedScores
        }catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
