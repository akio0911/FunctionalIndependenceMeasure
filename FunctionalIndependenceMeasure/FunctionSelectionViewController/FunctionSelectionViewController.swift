//
//  FunctionSelectionViewController.swift
//  Functional Independence Measure
//
//  Created by 村中令 on 2021/12/07.
//

import UIKit

class FunctionSelectionViewController: UIViewController {
    var targetPersonUUID: UUID?
    let fimRepository = FIMRepository()
    @IBOutlet weak private var asssessmentButton: UIButton!
    @IBOutlet weak private var fimListButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let targetPersonName =  fimRepository.loadTargetPerson(targetPersonUUID: targetPersonUUID!)?.name else {
            return
        }
        navigationItem.title = "対象者:　\(targetPersonName)　様"
        configueViewNavigationBarColor()
        configueViewButtonStyle()
    }
    // MARK: - Segue- FunctionSelectionViewController → AssessmentViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nav = segue.destination as? UINavigationController else { return }
        if let assessmentVC = nav.topViewController as? AssessmentViewController {
            switch segue.identifier ?? "" {
            case "assessment":
                assessmentVC.targetPersonUUID = targetPersonUUID
            default:
                break
            }
        }

        if let FIMTableVC = nav.topViewController as? FIMTableViewController {
            switch segue.identifier ?? "" {
            case "fimTable":
                FIMTableVC.targetPersonUUID = targetPersonUUID
            default:
                break
            }
        }
    }

    // MARK: - Segue- FunctionSelectionViewController ← AssessmentViewController
    @IBAction private func backToFunctionSelectionTableViewController(segue: UIStoryboardSegue) {
    }

    // MARK: - View Configue
    private func configueViewNavigationBarColor() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.baseColor
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }

    private func configueViewButtonStyle() {
        asssessmentButton.tintColor = Colors.baseColor
        asssessmentButton.backgroundColor = Colors.mainColor
        asssessmentButton.layer.cornerRadius = 10
        asssessmentButton.layer.shadowOpacity = 0.7
        asssessmentButton.layer.shadowRadius = 3
        asssessmentButton.layer.shadowColor = UIColor.black.cgColor
        asssessmentButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        fimListButton.tintColor = Colors.baseColor
        fimListButton.backgroundColor = Colors.mainColor
        fimListButton.layer.cornerRadius = 10
        fimListButton.layer.shadowOpacity = 0.7
        fimListButton.layer.shadowRadius = 3
        fimListButton.layer.shadowColor = UIColor.black.cgColor
        fimListButton.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
