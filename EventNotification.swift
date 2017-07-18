class User: MailServerDelegate {
    
    let mailServer: MailServer
    
    init(){
        self.mailServer = MailServer()
        self.mailServer.delegate = self
    }
    
    /*
     * ボタンが押された時の処理
     */
    func sendButtonPushed(message: String){
        // メールを送信する。送信の結果は、delegate経由で受け取る。
        self.mailServer.sendMail(message)
    }
    
    // 送信結果。mailServerからコールされる
    func onSuccessSendMail() -> Vold {
        print("success!")
    }
    func onFailureSendMail() -> Vold {
        print("failure..")
    }
}

protocol MailServerDelegate {
    
    /*
     * 送信した時のイベント
     * 「メール送信成功しました！」
     * 「メール送信失敗しました...」
     */
    func onSuccessSendMail() -> Vold
    func onFailureSendMail() -> Vold
}

// メールを送信して、delegateに対して結果を知らせます。
class MailServer {
    
    // イベントを通知する先
    weak var delegate: MailServerDelegate?
    
    /*
     * メールを送信する処理
     * 「あ、このメッセージを送るんですね、わかりました。メール送信します。
     *   完了したらdelegateに知らせますね。」
     */
    func sendMail(message: String) -> Void{
        // 非同期メール送信処理を書く
        if 成功 {
            self.delegate?.onSuccessSendMail()
        } else {
            self.delegate?.onFailureSendMail()
        }
    }
}
