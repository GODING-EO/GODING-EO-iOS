//
//  SchoolViewController.swift
//  GODING-EO
//
//  Created by 강한별 on 2022/10/06.
//

import UIKit

class SchoolViewController: UIViewController {

    
    @IBOutlet weak var schoolSearchBar: UISearchBar!
    @IBOutlet weak var schoolTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolTableView.delegate = self
        schoolTableView.dataSource = self
        schoolSearchBar.delegate = self
    }
    
}

extension SchoolViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = schoolTableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
}


extension SchoolViewController: UISearchBarDelegate{
    
}
