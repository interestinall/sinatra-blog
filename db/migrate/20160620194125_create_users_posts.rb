class CreateUsersPosts < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
    end

    create_table :posts do |t|
      t.text :content
      t.integer :user_id
    end
  end

end
