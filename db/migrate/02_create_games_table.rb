class CreateGamesTable < ActiveRecord::Migration

    def change

        create_table :games do |t|

            t.string :title

            t.text :description

            #t.integer :genre

            #t.integer :platform

            #t.integer :design

            #t.integer :features

            t.integer :user_id

            t.timestamps

        end 

    end

end