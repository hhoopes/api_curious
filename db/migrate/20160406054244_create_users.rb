class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :and_me_id

      t.timestamps null: false
    end
  end
end
