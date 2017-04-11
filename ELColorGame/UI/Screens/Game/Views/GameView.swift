//
//  Created by Mateusz Szklarek on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class GameView: UIView {

    weak var delegate: GameViewDelegate?

    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor(color: .DarkPurple383357)
        addSubviews()
        setupLayout()
        configurePauseButtonAction()
        configureRestartButtonAction()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateScore(score: Int) {
        scoreNumberLabel.text = "\(score)"
    }

    // MARK: Actions

    func configurePauseButtonAction() {
        pauseButton.buttonActionClosure = { [weak self] in
            guard let sself = self else { return }
            sself.delegate?.gameViewDidTapPause(gameView: sself)
        }
    }

    func configureRestartButtonAction() {
        restartButton.buttonActionClosure = { [weak self] in
            guard let sself = self else { return }
            sself.delegate?.gameViewDidTapRestart(gameView: self)
        }
    }

    // MARK: Subviews

    private func addSubviews() {
        addSubview(topView)
        topView.addSubview(pauseButton)
        topView.addSubview(restartButton)
        topView.addSubview(scoreView)
        scoreView.addSubview(scoreTextLabel)
        scoreView.addSubview(scoreNumberLabel)
        addSubview(boardContainerView)
    }

    private let topView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.clear
        return view
    }()

    private let pauseButton = Button(image: UIImage(asset: .Pause))
    private let restartButton = Button(image: UIImage(asset: .RestartIcon))

    private let scoreView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.clear
        return view
    }()

    private let scoreTextLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = score.localized
        label.font = UIFont(name: BebasNeueBold, size: 17)
        label.textColor = UIColor(color: .LightPurple7D75C7)
        return label
    }()

    private let scoreNumberLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "0"
        label.font = UIFont(name: BebasNeueBold, size: 46)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor(color: .White)
        return label
    }()

    let boardContainerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.clear
        return view
    }()

    var boardView: GameBoardView? {
        didSet {
            if let oldValue = oldValue {
                oldValue.removeFromSuperview()
            }
            if let boardView = boardView {
                configureBoardView(boardView: boardView)
            }
        }
    }

    // MARK: Layout

    private func setupLayout() {
        topView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(20)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.greaterThanOrEqualTo(72)
            make.height.equalTo(topView.superview!).multipliedBy(0.15).priorityLow()
        }
        pauseButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.centerY.equalTo(0)
        }
        pauseButton.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
        scoreView.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(0)
            make.left.greaterThanOrEqualTo(pauseButton.snp.right).offset(16)
            make.right.lessThanOrEqualTo(restartButton.snp.left).offset(-16)
        }
        scoreNumberLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.centerX.equalTo(0)
            make.left.greaterThanOrEqualTo(0)
            make.right.lessThanOrEqualTo(0)
        }
        scoreTextLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scoreNumberLabel.snp.bottom)
            make.centerX.equalTo(0)
            make.left.greaterThanOrEqualTo(0)
            make.right.lessThanOrEqualTo(0)
            make.bottom.equalTo(0)
        }
        restartButton.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(0)
            make.centerY.equalTo(0)
        }
        restartButton.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
        boardContainerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(topView.snp.bottom)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(-16)
        }
    }

    private func configureBoardView(boardView: GameBoardView) {
        boardView.delegate = self
        boardContainerView.addSubview(boardView)
        boardView.snp.makeConstraints({ (make) -> Void in
            make.edges.equalTo(0)
        })
    }

}
