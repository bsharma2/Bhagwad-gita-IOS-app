//
//  ChapterTableViewCell.swift
//  BhagavadGita
//
//  Created by Bhakti Sharma on 4/25/20.
//  Copyright © 2020 Bhakti Sharma. All rights reserved.
//

import UIKit

class ChapterTableViewCell: UITableViewCell {

    @IBOutlet private var chapterNameLabel: UILabel!
    @IBOutlet private var versesCountLabel: UILabel!

    func configure(with chapter: Chapter) {
      chapterNameLabel.text = chapter.name_meaning
      versesCountLabel.text = String(chapter.verses_count)
    }
}
