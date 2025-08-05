//
//  geminiServiceSwift.swift
//  Mulhim2
//
//  Created by leen binmueqal on 10/02/1447 AH.
//
// GeminiService.swift
// GeminiService.swift
import Foundation

func sendToGemini(prompt: String, completion: @escaping (String?) -> Void) {
    let modelName = "gemini-2.0-flash" // update as needed
    guard let url = URL(string:
      "https://generativelanguage.googleapis.com/v1beta/models/\(modelName):generateContent?key=\(GEMINI_API_KEY)"
    ) else {
        completion("Invalid URL")
        return
    }

    let requestData: [String: Any] = [
        "contents": [
            ["parts": [["text": prompt]]]
        ]
    ]

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpBody = try? JSONSerialization.data(withJSONObject: requestData)

    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            completion("Network error")
            return
        }

        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
           let candidates = json["candidates"] as? [[String: Any]],
           let content = candidates.first?["content"] as? [String: Any],
           let parts = content["parts"] as? [[String: Any]],
           let text = parts.first?["text"] as? String {
            completion(text)
        } else {
            completion("Unexpected response format")
        }
    }.resume()
}
