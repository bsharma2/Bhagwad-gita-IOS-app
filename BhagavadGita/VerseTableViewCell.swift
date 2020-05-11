//
//  VerseTableViewCell.swift
//  BhagavadGita
//
//  Created by Bhakti Sharma on 4/26/20.
//  Copyright © 2020 Bhakti Sharma. All rights reserved.
//

import UIKit

class VerseTableViewCell: UITableViewCell {

    @IBOutlet private var VerseNameLabel: UILabel!
    @IBOutlet private var verseMeaningLabel: UILabel!
    
    func configure(with verse: Verse) {
      VerseNameLabel.text = String(verse.verse_number)
      verseMeaningLabel.text = verse.meaning
    }
}
