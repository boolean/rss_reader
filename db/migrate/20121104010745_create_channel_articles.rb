class CreateChannelArticles < ActiveRecord::Migration
  def change
    create_table :channel_articles do |t|
      t.integer :article_id
      t.integer :channel_id
      t.boolean :starred

      t.timestamps
    end
  end
end
