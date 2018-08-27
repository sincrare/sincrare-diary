require 'rails_helper'

RSpec.describe "Signins", type: :system do

  def extract_confirmation_url(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end

  it "サインイン時認証メールが送信され、認証後アカウントが有効になる" do
    visit root_path
    expect {
      click_on "新規ユーザー登録"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "user_password", with: "test12345"
      fill_in "user_password_confirmation", with: "test12345"
      click_on "登録する"
    }.to change(ActionMailer::Base.deliveries, :size).by(1)
    expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"
    mail = ActionMailer::Base.deliveries.last
    url = extract_confirmation_url(mail)
    user = User.last
    expect(user.confirmed?).to be false
    visit url.sub("http://localhost:3000", "")
    expect(page).to have_content 'アカウントを登録しました。'
    expect(user.reload.confirmed?).to be true
  end
end