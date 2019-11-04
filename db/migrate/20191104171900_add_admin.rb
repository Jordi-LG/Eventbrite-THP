class AddAdmin < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :admin, foreign_key: {to_table: :users}
  end
end
