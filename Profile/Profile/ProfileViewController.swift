//
//  ProfileHeaderView.swift
//  Profile
//
//  Created by Arseniy Gusev on 3/17/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        view.backgroundColor = .systemGray3
    }


    struct Cells {
        static let videoCell = "VideoCell"
    }



    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Cells.videoCell)
        return tableView
    }()





    struct Images {
        static let first = UIImage(named: "img1")!
        static let secound = UIImage(named: "img2")!
        static let third = UIImage(named: "img3")!
        static let forth = UIImage(named: "img4")!
        static let fifth = UIImage(named: "img5")!

    }

    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        self.setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupSelf() {

        view.addSubview(tableView)

        NSLayoutConstraint.activate([

            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.self.bottomAnchor)
        ])


    }

}

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell, for: indexPath) as! PostTableViewCell

        let video = videos[indexPath.row]
        cell.set(video: video)

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           if section == 0 {
               let headerView = ProfileHeaderView()
               return headerView
           }
           return nil
       }

}
