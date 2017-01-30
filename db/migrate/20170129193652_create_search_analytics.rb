class CreateSearchAnalytics < ActiveRecord::Migration
  def change
    create_table :search_analytics do |t|
      t.string :article_title
      t.integer :quantity

      t.timestamps
    end
  end
end
