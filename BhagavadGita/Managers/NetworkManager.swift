//
//  NetworkManager.swift
//  BhagavadGita
//
//  Created by Bhakti Sharma on 4/25/20.
//  Copyright © 2020 Bhakti Sharma. All rights reserved.
//

import Foundation
import Auth0

final class NetworkManager {
    
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    
    Auth0
    .webAuth()
    .audience("https://{YOUR_AUTH0_DOMAIN}/userinfo")
    .start { result in
        switch result {
        case .success(let credentials):
            print("Obtained credentials: \(credentials)")
        case .failure(let error):
            print("Failed with \(error)")
        }
    }
    
    
    guard credentialsManager.hasValid() else {
        // Present login screen
    }
    
    credentialsManager.credentials { error, credentials in
        guard error == nil, let credentials = credentials else {
            // Handle error, present login page
        }
        // Valid credentials; you can access token properties such as `idToken`, `accessToken`.
    }
    
    var chapters: [Chapter] = []
    var verses: [Verse] = []
    private let accessToken = "GaL3WvFbdb6wNAcCaMVUMahwsLhXgN"
    private let chaptersDomainUrl = "https://bhagavadgita.io/api/v1/chapters?access_token="
    private let versesDomainUrl = "https://bhagavadgita.io/api/v1/chapters/1/verses?access_token="
    
    func fetchChapters(completionHandler: @escaping ([Chapter]) -> Void) {
      let url = URL(string: chaptersDomainUrl + accessToken)!

      let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
          print("Error with fetching films: \(error)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
          print("Error with the response, unexpected status code: \(response as Optional)")
          return
        }
        
        if let data = data,
            let filmSummary = try? JSONDecoder().decode([Chapter].self, from: data) {
               completionHandler(filmSummary)
            }
      })
      task.resume()
    }
    
    func fetchVerses(completionHandler: @escaping ([Verse]) -> Void) {
      let url = URL(string: versesDomainUrl + accessToken)!
        print("testing 3")
        

      let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        print("testing 4")
        if let error = error {
          print("Error with fetching films: \(error)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
          print("Error with the response, unexpected status code: \(response as Optional)")
          return
        }
        let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
        print(outputStr)
        if let data = data,
            
            let filmSummary = try? JSONDecoder().decode([Verse].self, from: data) {
                print("testing 5")
               completionHandler(filmSummary)

            }
      })
      task.resume()
    }
}
