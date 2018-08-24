require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article) }

  it "is valid with an all param" do
    expect(article).to be_valid
  end

  it "is invalid without entry_at" do
    article.title = nil
    expect(article).to_not be_valid
  end

  it "is invalid without title" do
    article.title = "   "
    expect(article).to_not be_valid
  end
end
