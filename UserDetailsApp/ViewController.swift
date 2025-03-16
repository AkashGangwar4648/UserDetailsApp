//
//  ViewController.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var imageViewAvatar: UIImageView!
    
    @IBOutlet weak var viewContainerID: UIView!
    @IBOutlet weak var labelID: UILabel!
    
    @IBOutlet weak var viewContainerUID: UIView!
    @IBOutlet weak var labelUID: UILabel!
    
    @IBOutlet weak var viewContainerUserName: UIView!
    @IBOutlet weak var labelUserName: UILabel!
    
    @IBOutlet weak var viewContainerFirstName: UIView!
    @IBOutlet weak var labelFirstName: UILabel!
    
    @IBOutlet weak var viewContainerLastName: UIView!
    @IBOutlet weak var labelLastName: UILabel!
    
    @IBOutlet weak var viewContainerEmail: UIView!
    @IBOutlet weak var labelEmailName: UILabel!
    
    @IBOutlet weak var viewContainerPassword: UIView!
    @IBOutlet weak var labelPassword: UILabel!
    
    @IBOutlet weak var buttonPrevRef: UIButton!
    
    @IBOutlet weak var buttonNextRef: UIButton!
    
    private let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.color = .systemBlue
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    // MARK: - PROPERTIES
    internal let userVM: UserDetailViewModel = UserDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
        
        
        
    }
    
    
    // MARK: - ACTIONS
    @IBAction func buttonPrevTapped(_ sender: UIButton) {
        userVM.decrementCurrentUserIndex()
    }
    
    @IBAction func buttonNextTapped(_ sender: UIButton) {
        userVM.incrementCurrentUserIndex()
    }
    
    
}


// MARK: - USER DEFINED METHODS
extension ViewController {
    // TODO: INITIAL SETUP
    internal func initialSetup() {
        self.setupUI()
        self.viewModelObservation()
    }
    
    // TODO: SETUP UI
    internal func setupUI() {
        // ROUND IMAGE
        self.imageViewAvatar.layer.cornerRadius = self.imageViewAvatar.frame.size.width / 2
        self.imageViewAvatar.clipsToBounds = true
        
        // BORDER IMAGE
        self.imageViewAvatar.layer.borderWidth = 2
        self.imageViewAvatar.layer.borderColor = UIColor.systemTeal.cgColor
        
        // CORNER RADIUS ID VIEW
        self.viewContainerID.layer.cornerRadius = 10
        self.viewContainerID.clipsToBounds = true
        
        // BORDER ID VIEW
        self.viewContainerID.layer.borderWidth = 1
        self.viewContainerID.layer.borderColor = UIColor.systemTeal.cgColor
        
        
        // CORNER RADIUS UID VIEW
        self.viewContainerUID.layer.cornerRadius = 10
        self.viewContainerUID.clipsToBounds = true
        
        // BORDER UID VIEW
        self.viewContainerUID.layer.borderWidth = 1
        self.viewContainerUID.layer.borderColor = UIColor.systemTeal.cgColor
        
        // CORNER RADIUS USER NAME VIEW
        self.viewContainerUserName.layer.cornerRadius = 10
        self.viewContainerUserName.clipsToBounds = true
        
        // BORDER USER NAME VIEW
        self.viewContainerUserName.layer.borderWidth = 1
        self.viewContainerUserName.layer.borderColor = UIColor.systemTeal.cgColor
        
        // CORNER RADIUS FIRST NAME VIEW
        self.viewContainerFirstName.layer.cornerRadius = 10
        self.viewContainerFirstName.clipsToBounds = true
        
        // BORDER FIRST NAME VIEW
        self.viewContainerFirstName.layer.borderWidth = 1
        self.viewContainerFirstName.layer.borderColor = UIColor.systemTeal.cgColor
        
        
        // CORNER RADIUS LAST NAME VIEW
        self.viewContainerLastName.layer.cornerRadius = 10
        self.viewContainerLastName.clipsToBounds = true
        
        // BORDER LAST NAME VIEW
        self.viewContainerLastName.layer.borderWidth = 1
        self.viewContainerLastName.layer.borderColor = UIColor.systemTeal.cgColor
        
        
        // CORNER RADIUS EMAIL VIEW
        self.viewContainerEmail.layer.cornerRadius = 10
        self.viewContainerEmail.clipsToBounds = true
        
        // BORDER LAST EMAIL VIEW
        self.viewContainerEmail.layer.borderWidth = 1
        self.viewContainerEmail.layer.borderColor = UIColor.systemTeal.cgColor
        
        
        // CORNER RADIUS PASSWORD VIEW
        self.viewContainerPassword.layer.cornerRadius = 10
        self.viewContainerPassword.clipsToBounds = true
        
        // BORDER LAST PASSWORD VIEW
        self.viewContainerPassword.layer.borderWidth = 1
        self.viewContainerPassword.layer.borderColor = UIColor.systemTeal.cgColor
        
        
        
        // CORNER RADIUS BUTTON PREVIOUS
        self.buttonPrevRef.layer.cornerRadius = 10
        self.buttonPrevRef.clipsToBounds = true
        
        // BORDER BUTTON PREVIOUS
        self.buttonPrevRef.layer.borderWidth = 1
        self.buttonPrevRef.layer.borderColor = UIColor.systemTeal.cgColor
        self.buttonPrevRef.setTitleColor(UIColor.systemTeal, for: .normal)
        self.buttonPrevRef.backgroundColor = .white
        
        
        // CORNER RADIUS BUTTON NEXT
        self.buttonNextRef.layer.cornerRadius = 10
        self.buttonNextRef.clipsToBounds = true
        
        // BORDER BUTTON NEXT
        self.buttonNextRef.layer.borderWidth = 1
        self.buttonNextRef.layer.borderColor = UIColor.systemTeal.cgColor
        self.buttonNextRef.setTitleColor(UIColor.white, for: .normal)
        self.buttonNextRef.backgroundColor = .systemTeal
        
        self.setupActivityIndicator()
    }
    
    // TODO: VIEW MODEL OBSERVATION
    internal func viewModelObservation() {
        userVM.callBackLoader = { [weak self] (isShowLoader) in
            guard let self = self else { return }
            if isShowLoader {
                DispatchQueue.main.async { [weak self] in
                    self?.showLoader()
                }
            }
        }
        
        userVM.callBackErrorMessage = { [weak self] (message) in
            guard let self = self else { return }
            if message.isEmpty == false {
                self.showAlert(on: self, title: "User Details", message: message)
            }
        }
        
        userVM.callBackUser = { [weak self] (user) in
            guard let self = self, let user = user else { return }
            self.labelID.text = "\(user.id ?? 0)"
            self.labelUID.text = "\(user.uid ?? "")"
            self.labelUserName.text = "\(user.username ?? "")"
            self.labelFirstName.text = "\(user.firstName ?? "")"
            self.labelLastName.text = "\(user.lastName ?? "")"
            self.labelEmailName.text = "\(user.email ?? "")"
            self.labelPassword.text = "\(user.password ?? "")"
            guard let imageString = user.avatar else { return }
            self.imageViewAvatar.loadImage(from: imageString)
            DispatchQueue.main.async {
                self.hideLoader()
            }
        }
    }
    
    private func setupActivityIndicator() {
        view.addSubview(loader)
        
        // Center the loader in the view
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func showLoader() {
        loader.startAnimating()
        loader.isHidden = false
    }
    
    private func hideLoader() {
        loader.stopAnimating()
        loader.isHidden = true
    }
    
    
    
    // TODO: SHOW ALERT
    private func showAlert(on viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
