class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :chatroom
      t.references :user
      t.text :body

      t.timestamps
    end
  end
end
