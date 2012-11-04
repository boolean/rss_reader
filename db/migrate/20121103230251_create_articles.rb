class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.string :description
      t.datetime :pub_date
      t.string :guid

      t.timestamps
    end
  end
end
