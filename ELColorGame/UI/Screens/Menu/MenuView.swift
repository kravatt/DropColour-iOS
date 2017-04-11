//
//  Created by Dariusz Rybicki on 07/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class MenuView: UIView {

    private weak var delegate: MenuViewDelegate?

    init(delegate: MenuViewDelegate?) {
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        loadSubviews()
        setupLayout()
        resumeButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapResume(menuView: self)
        }
        newGameButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapNewGame(menuView: self)
        }
        quitButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapQuit(menuView: self)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private func loadSubviews() {
        addSubview(blurEffectView)
        addSubview(resumeButton)
        addSubview(newGameButton)
        addSubview(quitButton)
        addSubview(pauseImageView)
        addSubview(pauseLabelText)
    }

    private let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark))
    private let resumeButton = Button(title: resume.localized, color: UIColor(color: .Blue0091FC))
    private let newGameButton = Button(title: newGame.localized, color: UIColor(color: .Green6BE01A))
    private let quitButton = Button(title: quit.localized, color: UIColor(color: .RedE82654))

    private let pauseImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.image = UIImage(asset: .PauseIcon)
        view.contentMode = UIViewContentMode.scaleAspectFit
        return view
    }()

    private let pauseLabelText: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = pause.localized
        label.font = UIFont(name: BebasNeueBold, size: 30)
        label.textColor = UIColor(color: .White)
        return label
    }()

    // MARK: Layout

    private func setupLayout() {
        blurEffectView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        resumeButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
            make.centerY.equalTo(0)
        }
        newGameButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(resumeButton.snp.bottom).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
        quitButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
            make.bottom.equalTo(-40)
        }
        pauseLabelText.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.bottom.equalTo(resumeButton.snp.top).offset(-40)
        }
        pauseImageView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(pauseLabelText.snp.top).offset(-20)
            make.centerX.equalTo(0)
        }
    }

}

// MARK: - Delegate

protocol MenuViewDelegate: class {

    func menuViewDidTapResume(menuView: MenuView)
    func menuViewDidTapNewGame(menuView: MenuView)
    func menuViewDidTapQuit(menuView: MenuView)

}
