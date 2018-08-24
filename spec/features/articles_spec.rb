require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  let(:article) { create(:article)}
  let(:admin) { create(:user, :with_admin)}

  before do
    login_as(admin)
  end

  scenario "管理者は記事を投稿できること" do
    visit admin_articles_path
    click_on "新規投稿"
    expect {
      fill_in "タイトル", with: "テスト記事"
      fill_in "本文", with: "テスト本文"
      check "公開"
      click_on "登録する"
      expect(page).to have_content "記事を投稿しました"
    }.to change(Article, :count).by(1)
  end

  scenario "管理者は記事を更新できること" do
    article
    visit admin_articles_path
    click_on "編集"
    expect {
      fill_in "タイトル", with: "記事の更新"
      click_on "更新する"
      expect(page).to have_content "記事を更新しました"
    }.to_not change(Article, :count)
    expect(article.reload.title).to eq "記事の更新"
  end

  scenario "管理者は記事を削除できること" do
    article
    visit admin_articles_path
    expect {
      click_on "削除"
      expect(page).to have_content "記事を削除しました"
    }.to change(Article, :count).by(-1)
  end
end
