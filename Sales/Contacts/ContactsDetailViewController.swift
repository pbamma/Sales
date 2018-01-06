//
//  ContactsDetailViewController.swift
//  Sales
//
//  Created by Philip Starner on 1/3/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageThumb: UIImageView!
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let tasks = ["follup email", "call at 12:00pm", "lunch"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageThumb.layer.cornerRadius = imageThumb.frame.size.height / 2
        imageThumb.layer.masksToBounds = true
        imageThumb.layer.borderWidth = 2
        imageThumb.layer.borderColor = Constants.COLOR_MAIN_TINT_2.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.item]
        
        return cell
    }

}
