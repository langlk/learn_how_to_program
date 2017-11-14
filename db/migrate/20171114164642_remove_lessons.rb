class RemoveLessons < ActiveRecord::Migration[5.0]
  def change
    drop_table :lessons
  end
end
