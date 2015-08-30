class AddIntroduceTousers < ActiveRecord::Migration
  def change
    add_column :users, :introduce, :text
  end
end
