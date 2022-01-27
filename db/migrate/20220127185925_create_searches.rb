class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :identifier
      t.boolean :complete
      t.string :last_completed_step

      t.boolean :do_you_have_a_trn
      t.string :name
      t.date :date_of_birth
      t.text :national_insurance_number
      t.text :itt
      t.text :tra_email
      t.text :email

      t.timestamps
    end
  end
end
