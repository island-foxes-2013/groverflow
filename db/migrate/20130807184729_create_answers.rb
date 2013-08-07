class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.boolean :best_answer, default: false
      t.references :user
      t.references :question
      t.timestamps
    end

  end

end
