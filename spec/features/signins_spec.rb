require 'rails_helper'

RSpec.feature "Signins", type: :feature do
  scenario "ユーザーがサインインする" do
    visit root_path
    expect {
      click_on "新規ユーザー登録"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "user_password", with: "test12345"
      fill_in "user_password_confirmation", with: "test12345"
      click_on "登録する"
    }.to change(User, :count).by(1)
  end
end
