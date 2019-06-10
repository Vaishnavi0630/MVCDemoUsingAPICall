//
//  ViewController.swift
//  Artical_Demo_Task
//
//  Created by Admin on 10/06/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewArtical: UITableView!
    
    var articalArray = [Artical]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let artical = ArticalService.instance
        artical.delegate = self
        tableViewArtical.isHidden = true
        tableViewArtical.rowHeight = UITableView.automaticDimension
        tableViewArtical.estimatedRowHeight = UITableView.automaticDimension
        ArticalService.instance.getArticalData()

        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableViewArtical.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArticalTableViewCell
    
        let artical = articalArray[indexPath.row]
        cell.populate(with: artical)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: ArticalDelegate{
    
    func showArticalData(artical: [Artical]) {
        
        self.articalArray = artical
        tableViewArtical.delegate = self
        tableViewArtical.dataSource = self
        tableViewArtical.isHidden = false
        tableViewArtical.reloadData()
    }
}

