class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, null: false, index: true
      t.references :user, null: false, index: true
      
      t.timestamps
    end
  end
end
