require 'rails_helper'

RSpec.describe "Articles", type: :system, js: true do
  let!(:article) { create(:article)}
  let(:admin) { create(:user, :with_admin)}

  before do
    admin.confirm
    login_as(admin)
  end

  it "管理者は記事を投稿できること" do
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

  it "管理者は記事を更新できること" do
    visit admin_articles_path
    click_on "編集"
    expect {
      fill_in "タイトル", with: "記事の更新"
      click_on "更新する"
      expect(page).to have_content "記事を更新しました"
    }.to_not change(Article, :count)
    expect(article.reload.title).to eq "記事の更新"
  end

  it "管理者は記事を削除できること" do
    visit admin_articles_path
    expect {
      click_on "削除"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content "記事を削除しました"
    }.to change(Article, :count).by(-1)
  end

  it "管理者は画像をアップロードできること" do
    visit admin_articles_path
    click_on "編集"
    click_on "画像の追加"
    expect {
      fill_in "タイトル", with: "記事の更新"
      find(".image_field input[type='file']").set(Rails.root.join('spec', 'factories', 'files', 'sample.png'))
      click_on "更新する"
      expect(page).to have_content "記事を更新しました"
    }.to_not change(Article, :count)
    click_on "編集"
    expect(page).to have_content "sample.png"
  end
end
