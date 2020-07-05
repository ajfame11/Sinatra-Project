class CreateGamesTable < ActiveRecord::Migration

    def change

        create_table :games do |t|

            t.string :title

            t.text :description

            t.integer :size

            t.integer :price

            t.integer :user_id

            t.timestamps

        end 

    end

end