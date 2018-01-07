//
//  ContactsViewController.swift
//  Sales
//
//  Created by Philip Starner on 1/2/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit
import Firebase

class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var rootRef: DatabaseReference!
    private var databaseHandle: DatabaseHandle!
    var contacts: [DataSnapshot]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        addButton.layer.masksToBounds = true
        
        configureDatabase()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    deinit {
        if let databaseHandle = databaseHandle {
            self.rootRef.child("contacts").removeObserver(withHandle: databaseHandle)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureDatabase() {
        rootRef = Database.database().reference()
        databaseHandle = rootRef.child("contacts").observe(DataEventType.childAdded, with:  { [weak self] (snapshot: DataSnapshot) in
            guard let strongSelf = self else { return }
            strongSelf.contacts.append(snapshot)
            strongSelf.tableView.insertRows(at: [IndexPath(row: strongSelf.contacts.count-1, section: 0)], with: .automatic)
        })
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.title = "Details"
    }
 
    @IBAction func onAdd(_ sender: Any) {
        
        self.addButton.alpha = 0.2
        UIView.animate(withDuration: 0.5) {
            self.addButton.alpha = 1.0
        }
    }
    
   

}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactsTableViewCell
        
        let contact = self.contacts[indexPath.row]
        cell.loadData(snapshot: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showContactsDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
