class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail.subject
#
  def sendmail_confirm(email)
    @email = email
    mail( to: email, subject: 'sharin 登録用URLのご案内')
  end

  def sendmail_password_reset(email)
    @email = email
    mail( to: email, subject: 'sharin パスワード再設定のご案内')
  end

end