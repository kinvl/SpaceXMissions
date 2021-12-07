//
//  MissionTableViewCell.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import UIKit

class MissionTableViewCell: UITableViewCell, Identifable {
    
    func initializeCell(_ item: DisplayableMission) {
        missionNameLabel.text = item.missionName
        missionIdLabel.text = "ID: " + item.missionId
        manufacturersLabel.text = "Manufacturers: " + item.manufacturers.joined(separator: ", ")
        payloadIdsLabel.text = "Payload IDs:\n " + item.payloadIds.joined(separator: ", \n ")
        wikipediaButton.associatedURLString = item.wikipedia
        websiteButton.associatedURLString = item.website
        twitterButton.associatedURLString = item.twitter
        descriptionLabel.text = item.description
    }
    
    var buttonCallback: ((String?) -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        [missionNameLabel, detailsStackView].forEach { addSubview($0) }
    }
    
    private func setupSubviews() {
        setupMissionNameLabelLayout()
        setupDetailsStackViewLayout()

    }
    
    private func setupMissionNameLabelLayout() {
        NSLayoutConstraint.activate([
            missionNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            missionNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            missionNameLabel.heightAnchor.constraint(equalToConstant: missionNameLabel.font.pointSize)
        ])
    }
    
    private func setupDetailsStackViewLayout() {
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: missionNameLabel.bottomAnchor, constant: 5),
            detailsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
    
    @objc private func websiteButtonTapped(_ sender: WebsiteButton) {
        buttonCallback?(sender.associatedURLString)
    }
    
    private lazy var missionNameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    private lazy var missionIdLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    private lazy var manufacturersLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.adjustsFontSizeToFitWidth = true
    }
    
    private lazy var payloadIdsLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.adjustsFontSizeToFitWidth = true
        $0.numberOfLines = 0
    }
    
    private lazy var detailsStackView = UIStackView(arrangedSubviews: [missionIdLabel, manufacturersLabel, payloadIdsLabel, buttonsStackView, descriptionLabel]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 3
    }
    
    private lazy var buttonsStackView = UIStackView(arrangedSubviews: [wikipediaButton, websiteButton, twitterButton]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private lazy var wikipediaButton = WebsiteButton(type: .system).then {
        $0.setImage(UIImage(named: "wiki"), for: .normal)
        $0.addTarget(self, action: #selector(websiteButtonTapped), for: .touchUpInside)
    }
    
    private lazy var websiteButton = WebsiteButton(type: .system).then {
        $0.setImage(UIImage(named: "website"), for: .normal)
        $0.addTarget(self, action: #selector(websiteButtonTapped), for: .touchUpInside)
    }
    
    private lazy var twitterButton = WebsiteButton(type: .system).then {
        $0.setImage(UIImage(named: "twitter"), for: .normal)
        $0.addTarget(self, action: #selector(websiteButtonTapped), for: .touchUpInside)
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 0
    }
}
