//
//  ViewController.swift
//  AutoresizeCell
//
//  Created by Ricardo Yamaguchi on 17/03/19.
//  Copyright © 2019 Ricardo Yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var tableHeight: NSLayoutConstraint?
    
    private let data = [
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum malesuada purus quis accumsan facilisis. Integer in porttitor ex, at interdum quam. Sed vitae ultricies massa, eget tincidunt ipsum. Suspendisse potenti. Sed pellentesque varius tincidunt. Mauris quis molestie augue. Curabitur sed elementum massa.",
                        "Phasellus lacus dolor, commodo quis nulla sed, facilisis viverra elit. Suspendiss potenti. Quisque aliquet tempus sapien eget placerat. Nullam massa mi, hendrerit eget maximus rutrum, gravida sit amet ex. Etiam sollicitudin libero sit amet tellus ultricies rutrum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi felis metus, ornare at iaculis ut, tincidunt eget arcu. Maecenas iaculis neque vel dui scelerisque efficitur. Donec mattis erat nec lectus fringilla laoreet. Ut posuere turpis elementum consectetur hendrerit. Etiam pulvinar sapien id lacinia viverra. Etiam convallis pretium dignissim. Aenean vitae dolor eu orci cursus interdum.",
                        "Sed quam risus, maximus vulputate vulputate nec, sagittis ut felis. Phasellus nunc nunc, tempus in eleifend vitae, eleifend vel ligula. Nam tincidunt faucibus turpis vel rutrum. Aliquam cursus sed lacus quis fringilla. Vestibulum euismod purus ut velit ornare dictum. Nulla dui turpis, sollicitudin id tellus a, vehicula pretium augue. Vivamus eget congue nisi, ac ornare ipsum. Fusce at elit sed leo maximus vehicula ac nec sapien. Fusce accumsan ante non dolor vulputate, et rutrum odio fringilla. Praesent aliquam magna eleifend eros mollis placerat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras ac posuere nulla. Donec eu eros a felis volutpat ultrices.",
                        "Ut blandit sodales feugiat. Quisque finibus vestibulum dui. Sed euismod tempor suscipit. Praesent nec felis commodo, maximus sem eget, ultricies mi. Etiam accumsan neque in consequat laoreet. Sed justo diam, venenatis quis lobortis sed, eleifend quis neque. Mauris nec enim sem.",
                        "Duis dignissim lectus vel tristique eleifend. Phasellus at nibh odio. Fusce vitae sem non sapien accumsan viverra a vitae nibh. Vivamus diam elit, aliquet eu feugiat ac, cursus non felis. Aliquam rutrum porta tempus. Integer eget sollicitudin nisi, a euismod justo. Nullam ultrices mattis ullamcorper. Praesent mattis odio vel tellus maximus, non finibus lacus tincidunt."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableHeight?.constant = tableView?.contentSize.height ?? 256
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewWillLayoutSubviews()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? Cell else { return Cell() }
        cell.content = data[indexPath.row]
        return cell
    }
}
