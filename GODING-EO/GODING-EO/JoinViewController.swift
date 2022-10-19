//
//  JoinViewController.swift
//  GODING-EO
//
//  Created by 강한별 on 2022/09/29.
//

import UIKit
import DropDown

class JoinViewController: UIViewController {
    let textColor595959 = UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)
    let dropDownBackgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
    
    let job = ["고등학교 재학생", "중학교 재학생", "교직원", "기타(학부모 등)"]
    let grade = [1,2,3]
    
    let jobDropDown = DropDown()
    let gradeDropDown = DropDown()
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBOutlet weak var jobView: UIView!
    @IBOutlet weak var jobTextField: UITextField!{
        didSet{jobTextField.textColor = textColor595959}}
    @IBOutlet weak var jobUpDownImage: UIImageView!
    @IBAction func jobButton(_ sender: Any) {
        jobDropDown.show()
        self.jobUpDownImage.image = UIImage(named: "bigTriangleUp")
    }
    
    
    @IBOutlet weak var gradeView: UIView!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var gradeUpDownImage: UIImageView!
    @IBAction func gradeButton(_ sender: Any) {
        gradeDropDown.show()
        self.gradeUpDownImage.image = UIImage(named: "smallTriangleUp")
    }
    
    
    @IBOutlet weak var schoolTextField: UITextField!
    
    @IBOutlet var joinLabel: [UILabel]!
    
    @IBOutlet var gradeClass: [UILabel]!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet var line: [UIImageView]!
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDropDown()
        labelPartColorChange()
        gradeClassHide()
    }
    
    func gradeClassHide(){
        for label in gradeClass{label.isHidden = true}
        for image in line{image.isHidden = true}
        gradeView.isHidden = true
        classTextField.isHidden = true
        classTextField.isHidden = true
    }
    
    func gradeClassShow(){
        for label in gradeClass{label.isHidden = false}
        for image in line{image.isHidden = false}
        gradeView.isHidden = false
        classTextField.isHidden = false
        classTextField.isHidden = false
        
    }
    
    func labelPartColorChange(){
        for label in joinLabel{
            let labelText = label.text ?? ""
            let attribtuedString = NSMutableAttributedString(string: labelText)
            let range = (labelText as NSString).range(of: "*")
            attribtuedString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
            label.attributedText = attribtuedString
        }
    }
    
    func setDropDown(){
        DropDown.appearance().textColor = textColor595959
        DropDown.appearance().selectedTextColor = textColor595959
        DropDown.appearance().backgroundColor = dropDownBackgroundColor
        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        
        // jobDropDown set
        jobDropDown.dismissMode = .automatic
        jobDropDown.dataSource = job
        jobDropDown.anchorView = self.jobView
        jobDropDown.bottomOffset = CGPoint(x: 0, y:(jobDropDown.anchorView?.plainView.bounds.height)!)
        
        jobDropDown.selectionAction = { [weak self] (index, item) in
            self!.jobTextField.text = item
            self!.jobUpDownImage.image = UIImage.init(named: "bigTriangleDown")
            if item == self!.job[0] || item == self!.job[1]{
                self!.gradeClassShow()
            }else{
                self!.gradeClassHide()
            }
        }
        jobDropDown.cancelAction = { [weak self] in
            self!.jobUpDownImage.image = UIImage.init(named: "bigTriangleDown")
        }
        
        // gradeDropDown set
        gradeDropDown.dismissMode = .automatic
        gradeDropDown.dataSource = job
        gradeDropDown.anchorView = self.jobView
        gradeDropDown.bottomOffset = CGPoint(x: 0, y:(gradeDropDown.anchorView?.plainView.bounds.height)!)
        
        gradeDropDown.selectionAction = { [weak self] (index, item) in
            self!.gradeTextField.text = item
            self!.gradeUpDownImage.image = UIImage.init(named: "smallTriangleDown")
        }
        gradeDropDown.cancelAction = { [weak self] in
            self!.gradeUpDownImage.image = UIImage.init(named: "smalTriangleDown")
        }
    }
    
}
