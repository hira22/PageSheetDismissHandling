//
//  PageSheetViewController.swift
//  PageSheetDismissHandling
//
//  Created by hiraoka on 2019/11/22.
//  Copyright © 2019 hiraoka. All rights reserved.
//

import UIKit

class PageSheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIAdaptivePresentationControllerDelegateを渡す
        navigationController?.presentationController?.delegate = self
    }

}

extension PageSheetViewController: UIAdaptivePresentationControllerDelegate {
    // true: スワイプで閉じる false: スワイプで閉じない
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        false
    }
    
    // スワイプで閉じない場合に実行したい処理
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "閉じる", style: .default) { _ in
            self.dismiss(animated: true)
        })
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
