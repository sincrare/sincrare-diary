require 'rails_helper'

RSpec.describe "Logins", type: :system do
  let(:user) { create(:user) }

  it "ユーザーがログインできること" do
    visit root_path
    click_on "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_on "ログインする"
    expect(page).to have_content "ログインしました。"
  end

  it "ユーザーがログアウトできること" do
    login_as(user)
    visit root_path
    click_on "ログアウト"
    expect(page).to have_content "ログアウトしました。"
  end
end
