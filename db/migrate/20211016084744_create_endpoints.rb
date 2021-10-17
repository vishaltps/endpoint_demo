class CreateEndpoints < ActiveRecord::Migration[6.1]
  def change
    create_table :endpoints do |t|
      t.string :verb, null: false
      t.string :path, null: false
      t.json :response, default: {}

      t.timestamps
    end
  end
end
