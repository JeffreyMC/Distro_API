class CreateDistros < ActiveRecord::Migration[7.0]
  def change
    create_table :distros do |t|
      t.string :nombre
      t.string :url

      t.timestamps
    end
  end
end
