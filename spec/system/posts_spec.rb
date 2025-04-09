require 'rails_helper'

RSpec.describe "投稿機能", type: :system do
  let(:user) { create(:user) }

  it "投稿した画像が投稿詳細に表示される" do
    post = create(:post, user: user)
    post.image.attach(
      io: File.open(Rails.root.join("spec/fixtures/sample.jpg")),
      filename: "sample.jpg",
      content_type: "image/jpeg"
    )
    post.save!

    visit post_path(post)

    expect(page).to have_css("img[src*='sample.jpg']")
  end
end

## FactoryBotなしコード
# require 'rails_helper'

# RSpec.describe "投稿機能", type: :system do
#   it "投稿した画像が投稿詳細に表示される" do
#     user = User.create!(name: "テストユーザー", email: "test@example.com", password: "password")
#     post = Post.new(
#       title: "画像付き投稿",
#       content: "画像の表示をテストします。",
#       user: user
#     )

#     # ActiveStorageに画像を添付
#     post.image.attach(
#       io: File.open(Rails.root.join("spec/fixtures/sample.jpg")),
#       filename: "sample.jpg",
#       content_type: "image/jpeg"
#     )
#     post.save!

#     # 投稿詳細ページへアクセス
#     visit post_path(post)

#     # 画像が表示されているか確認
#     expect(page).to have_css("img[src*='sample.jpg']")
#   end
# end
