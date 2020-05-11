//
//  ViewController.swift
//  BhagavadGita
//
//  Created by Bhakti Sharma on 4/24/20.
//  Copyright © 2020 Bhakti Sharma. All rights reserved.
//

import UIKit

class ChaptersTableViewController: UITableViewController {

    private let cellIdentifier = "ChapterItem"
    private var chapters: [Chapter]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager().fetchChapters { [weak self] (chapters) in
            self?.chapters = chapters
          DispatchQueue.main.async {
            self?.tableView.reloadData()
          }
        }
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChapterTableViewCell else {
            fatalError("Issue dequeuing \(cellIdentifier)")
          }
        cell.configure(with: chapters?[indexPath.row] ?? Chapter(chapter_number: 0, chapter_summary:"Wait", name:"Wait", name_meaning:"Wait", name_translation: "Wait for it..", name_transliterated: "Wait", verses_count: 0))
          return cell
        }
    
}

