class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false, default: ""  #deviseをカスタム:名前追加
    add_column :users, :bio, :text  #deviseをカスタム:自己紹介追加
  end
end
