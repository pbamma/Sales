//
//  ContactsViewController.swift
//  Sales
//
//  Created by Philip Starner on 1/2/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    let names = ["Bill Foote", "Philip Starner", "Joe", "Jane", "Louis", "Alejandra", "Phong", "Sam", "Lonie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        addButton.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactsTableViewCell
        
        cell.nameLabel.text = names[indexPath.item]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showContactsDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
