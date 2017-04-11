//
//  Created by Mateusz Szklarek on 25/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {

    private weak var delegate: MenuViewControllerDelegate?
    let tracker: TrackerProtocol

    init(delegate: MenuViewControllerDelegate?, tracker: TrackerProtocol) {
        self.delegate = delegate
        self.tracker = tracker
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = MenuView(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "MenuViewController")
    }

    // MARK: MenuViewDelegate

    func menuViewDidTapResume(menuView: MenuView) {
        self.dismiss(animated: true) {
            self.delegate?.menuViewControllerDidResumeGame(menuViewController: self)
        }
    }

    func menuViewDidTapNewGame(menuView: MenuView) {
        self.dismiss(animated: true) {
            self.delegate?.menuViewControllerDidTapNewGame(menuViewController: self)
        }
    }

    func menuViewDidTapQuit(menuView: MenuView) {
        self.dismiss(animated: true) {
            self.delegate?.menuViewControllerDidTapQuit(menuViewController: self)
        }
    }

}

// MARK: - Delegate

protocol MenuViewControllerDelegate: class {

    func menuViewControllerDidResumeGame(menuViewController: MenuViewController)
    func menuViewControllerDidTapNewGame(menuViewController: MenuViewController)
    func menuViewControllerDidTapQuit(menuViewController: MenuViewController)

}
