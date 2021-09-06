class CreateBenefits < ActiveRecord::Migration[6.1]
  def change
    create_table :benefits do |t|
      t.string  :name,     null: false
      t.decimal :price,    null: false

      t.timestamps
    end

    add_index :benefits, :name,   unique: true
  end
end
