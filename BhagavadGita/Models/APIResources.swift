//
//  APIResources.swift
//  BhagavadGita
//
//  Created by Bhakti Sharma on 4/25/20.
//  Copyright © 2020 Bhakti Sharma. All rights reserved.
//

import Foundation

struct Chapter: Codable {
    let chapter_number: Int
    let chapter_summary: String
    let name: String
    let name_meaning: String
    let name_translation: String
    let name_transliterated: String
    let verses_count: Int
    
    init(chapter_number: Int, chapter_summary: String, name: String, name_meaning: String, name_translation: String, name_transliterated: String, verses_count: Int) {
        self.chapter_number = chapter_number
        self.chapter_summary = chapter_summary
        self.name = name
        self.name_meaning =  name_meaning
        self.name_translation = name_translation
        self.name_transliterated = name_transliterated
        self.verses_count = verses_count
      }
}

struct Verse: Codable {
    let chapter_number: Int
    let meaning: String
    let text: String
    let transliteration: String
    let verse_number: Int
    let word_meanings: String
    
    init(chapter_number: Int, meaning: String, text: String, transliteration: String, verse_number: Int, word_meanings: String) {
        self.chapter_number = chapter_number
        self.meaning = meaning
        self.text = text
        self.transliteration =  transliteration
        self.word_meanings = word_meanings
        self.verse_number = verse_number
      }
}
