class AddPublicToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :public, :boolean
  end
end
