class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, nul: false
      t.references :task, nul: false
      t.text :content, nul: false
      t.timestamps
    end
  end
end
