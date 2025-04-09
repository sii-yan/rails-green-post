require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }

  it "タイトルと内容とユーザーがあれば有効" do
    post = build(:post, user: user)
    expect(post).to be_valid
  end

  it "タイトルがないと無効" do
    post = build(:post, title: nil, user: user)
    expect(post).not_to be_valid
  end

  it "内容がないと無効" do
    post = build(:post, content: nil, user: user)
    expect(post).not_to be_valid
  end

  it "ユーザーがないと無効" do
    post = build(:post, user: nil)
    expect(post).not_to be_valid
  end
end

## FactoryBotなしコード
# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   let(:user) { User.create!(name: "テストユーザー", email: "test@example.com", password: "password") }

#   it "タイトルと内容とユーザーがあれば有効" do
#     post = Post.new(title: "テストタイトル", content: "本文です", user: user)
#     expect(post).to be_valid
#   end

#   it "タイトルがないと無効" do
#     post = Post.new(title: nil, content: "本文です", user: user)
#     expect(post).not_to be_valid
#   end

#   it "内容がないと無効" do
#     post = Post.new(title: "タイトル", content: nil, user: user)
#     expect(post).not_to be_valid
#   end

#   it "ユーザーがないと無効" do
#     post = Post.new(title: "タイトル", content: "本文です", user: nil)
#     expect(post).not_to be_valid
#   end
# end
