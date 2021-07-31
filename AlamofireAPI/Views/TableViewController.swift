//
//  TableViewController.swift
//  AlamofireAPI
//
//  Created by IwasakIYuta on 2021/07/31.
//

import UIKit

class TableViewController: UITableViewController {
    private var user = [Owner]()
    private var repository = [HaguremonRepository]()
   static let identifier = "cell"
    private let alamoFireApi = AlamofireAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        alamoFireApi.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return user.count
        case 1:
            return repository.count
        default:
            return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewController.identifier, for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = user[indexPath.row].login
            return cell
        case 1:
            cell.textLabel?.text = repository[indexPath.row].fullName
            return cell
        
        default:
            return cell
        }
    }
}
extension TableViewController: getMyGitHubDelegate {
    func getUser(user: [Owner]) {
        self.user = user
    }
    
    func geteRepository(repository: [HaguremonRepository]) {
        self.repository = repository
    }
    
    
}
