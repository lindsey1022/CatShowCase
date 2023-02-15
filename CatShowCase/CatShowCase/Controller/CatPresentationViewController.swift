//
//  CatPresentationViewController.swift
//  CatShowCase
//
//  Created by XIN LIU on 2/14/23.
//

import UIKit

/// ViewController used for presenting Cat information and handle user actions
class CatPresentationViewController: UIViewController {
    
    var viewModel: CatPresentationViewModel
    
    private let catInformationView: CatInformationView = {
        let informationView = CatInformationView()
        informationView.translatesAutoresizingMaskIntoConstraints = false
        return informationView
    }()

    // MARK: - Life Cycle
    
    init(viewModel: CatPresentationViewModel = CatPresentationViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.title = viewModel.navigationTitle
        self.view.backgroundColor = UIColor.white
        addTapScreenAction()
        fetchNewCatInfo()
    }
    
    // MARK: - View Setup
    
    /// Add subviews and configure layouts
    private func setupViews() {
        self.view.addSubview(catInformationView)
        NSLayoutConstraint.activate([
            catInformationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            catInformationView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            catInformationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            catInformationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    /// Add tap gesture to the whole view
    private func addTapScreenAction() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        self.view.addGestureRecognizer(tapRecognizer)
        self.view.isUserInteractionEnabled = true
    }
    
    // MARK: - User Actions
    
    @objc
    func screenTapped() {
        fetchNewCatInfo()
    }
    
    private func fetchNewCatInfo() {
        Task.init{
            //disable user interactions while waiting for response
            self.view.isUserInteractionEnabled = false
            await viewModel.fetchNewCatInfo()
            if let image = viewModel.currentCatImage, let fact = viewModel.currentCatFact {
                updateCatInfo(with: fact, image: image)
            } else {
                showErrorMessage(message: viewModel.failedText)
            }
            self.view.isUserInteractionEnabled = true
        }
    }

}

// MARK: - CatPresentationViewModelDelegate
extension CatPresentationViewController {
    func updateCatInfo(with text: String, image: UIImage) {
        catInformationView.configure(image: image, text: text)
    }
    
    func showErrorMessage(message: String) {
        let alert = UIAlertController(title: viewModel.alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: viewModel.okayButtonTitle, style: .cancel))
        // show an alert that would dismiss
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
        
        // Wait 2 seconds then dismiss
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000), execute: {
            alert.dismiss(animated: true)
        })
    }
}
