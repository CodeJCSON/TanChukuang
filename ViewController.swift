//
//  ViewController.swift
//  LHBoxView
//
//  Created by 李瀚 on 16/6/4.
//  Copyright © 2016年 李瀚. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func top(_ sender: UIButton) {

        let boxView = LHBoxView(locationView: sender, isTop: true, items: ["11","22"], itemSize: CGSize(width: 50, height: 20)) { (index) in
            let alertController = UIAlertController(title: "index:\(index)", message: nil, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        boxView.display()
    }

    @IBAction func botttom(_ sender: UIButton) {
        let boxView = LHBoxView(locationView: sender, isTop: false, items: ["11","22"], itemSize: CGSize(width: 50, height: 20)) { (index) in
            let alertController = UIAlertController(title: "index:\(index)", message: nil, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        boxView.display()
    }
    
    @IBAction func custom(_ sender: UIButton) {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 20
        let boxView = LHBoxView(loactionView: sender, isTop: true, customView: tableView)
        boxView.display()
        
    }
    
    @IBAction func edge(_ sender: UIButton) {
        let boxView = LHBoxView(locationView: sender, isTop: true, items: ["11","22"], itemSize: CGSize(width: 60, height: 20), block: nil)
        boxView.display()
    }
    
    @IBAction func leftEdge(_ sender: UIButton) {
        let boxView = LHBoxView(locationView: sender, isTop: false, items: ["11","22"], itemSize: CGSize(width: 60, height: 20), block: nil)
        boxView.display()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

