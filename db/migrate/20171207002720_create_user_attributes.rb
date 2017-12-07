class CreateUserAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_attributes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      # declaring foreign key to a user
      t.string :nickname, null: true
      # Nickname of a user
      t.integer :age
      # Age of a user
      t.string :major, null: true
      # Major of a user
      t.integer :enterYear
      # Entering year of a user
    end
  end
end
