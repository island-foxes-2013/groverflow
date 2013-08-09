class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :question, as: :votable
      t.belongs_to :answer, as: :votable
      t.integer :value
    end
  end
end
