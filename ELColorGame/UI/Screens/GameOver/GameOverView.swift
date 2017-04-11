//
// Created by Mateusz Szklarek on 23/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

protocol GameOverViewDelegate: class {

    func gameOverViewDidTapRetry(gameOverView: GameOverView)
    func gameOverViewDidTapShowLeaders(gameOverView: GameOverView)
    func gameOverViewDidTapQuit(gameOverView: GameOverView)

}

class GameOverView: UIView {

    let score: Int

    private weak var delegate: GameOverViewDelegate?

    init(score: Int, delegate: GameOverViewDelegate?) {
        self.score = score
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        addSubviews()
        setupLayout()
        configureButtonActions()
        updateScore()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateScore() {
        scoreNumberLabel.text = "\(score)"
    }

    // MARK: Subviews

    private func addSubviews() {
        addSubview(blurEffectView)
        addSubview(scoreView)
        scoreView.addSubview(scoreNumberLabel)
        scoreView.addSubview(scoreTextLabel)
        addSubview(retryButton)
        addSubview(rankingButton)
        addSubview(quitButton)
    }

    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark))
    private let scoreView = UIView(frame: CGRect.zero)
    private let retryButton = Button(title: retry.localized, color: UIColor(color: .Green6BE01A))
    private let rankingButton = Button(title: ranking.localized, color: UIColor(color: .Turquoise54C7C7))
    private let quitButton = Button(title: quit.localized, color: UIColor(color: .RedE82654))

    private let scoreNumberLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(name: BebasNeueBold, size: 60)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor(color: .White)
        return label
    }()

    private let scoreTextLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = yourScore.localized
        label.font = UIFont(name: BebasNeueBold, size: 20)
        label.textColor = UIColor(color: .White)
        return label
    }()

    // MARK: Layout

    private func setupLayout() {
        blurEffectView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        scoreView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(0).offset(-110)
            make.centerX.equalTo(0)
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
        retryButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scoreTextLabel.snp.bottom).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
        rankingButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(retryButton.snp.bottom).offset(15)
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
    }

    // MARK: Button actions

    private func configureButtonActions() {
        retryButton.buttonActionClosure = { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.gameOverViewDidTapRetry(self)
        }
        rankingButton.buttonActionClosure = { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.gameOverViewDidTapShowLeaders(self)
        }
        quitButton.buttonActionClosure = { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.gameOverViewDidTapQuit(self)
        }
    }

}
