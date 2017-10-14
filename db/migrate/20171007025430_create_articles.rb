class CreateArticles < ActiveRecord::Migration[5.1]
  #migration feita para criação dos parametros title e description de article, com adição das timestamps padroes(updated_at e created_at)
  def change
    create_table :articles do |t|
      t.string :title
      t.text :descriptions

      t.timestamps
    end
  end
end
