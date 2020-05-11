//
//  VersesTableViewController.swift
//  BhagavadGita
//
//  Created by Bhakti Sharma on 4/26/20.
//  Copyright © 2020 Bhakti Sharma. All rights reserved.
//

import UIKit

class VersesTableViewController: UITableViewController {
    
    private let cellIdentifier = "VersesItem"
    private var verses: [Verse]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager().fetchVerses { [weak self] (verses) in
          self?.verses = verses
            print("testing 1")
            DispatchQueue.main.async {
              self?.tableView.reloadData()
            }
        }
    }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? VerseTableViewCell else {
                fatalError("Issue dequeuing \(cellIdentifier)")
              }
            print("testing 2")
            cell.configure(with: verses?[indexPath.row] ?? Verse(chapter_number: 0, meaning:"Wait", text:"Wait", transliteration:"Wait", verse_number: 0, word_meanings: "Wait"))
              return cell
            }
    }
