class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      # External Relationships
      t.references :agency, :dvd_delivery_location # non-required references
      t.integer :customer_id, :null => false, :default => 0  # required reference (zero will fail foreign key constraint)
      t.integer :units_count, :default => 0
      t.integer :invoices_count, :default => 0
      t.integer :automation_messages_count, :default => 0
      t.integer :master_files_count, :default => 0
         
      # Pre-production work
      t.datetime :date_canceled
      t.datetime :date_deferred
      t.date :date_due # Patron's requested due date, or date assigned by production staff any time after request submission
      t.datetime :date_fee_estimate_sent_to_customer # Datetime that email sent by system to patron requesting fee, if request requires fee
      t.datetime :date_order_approved
      t.datetime :date_permissions_given
      t.datetime :date_started
      t.datetime :date_request_submitted # Datetime of patron request submission
      t.string :entered_by  # Retains the user id of the person making the request if the request is placed on behalf of another person
      t.decimal :fee_actual, :precision => 7, :scale => 2
      t.decimal :fee_estimated, :precision => 7, :scale => 2
      t.boolean :is_approved, :null => false, :default => 0  # boolean values should be 0 or 1 (disallow NULL)
      t.string :order_status
      t.string :order_title # Production staff may assign order human readable title for quick reference
      t.text :special_instructions
      t.text :staff_notes
      
      # Post-production work
      t.datetime :date_archiving_complete
      t.datetime :date_customer_notified
      t.datetime :date_finalization_begun
      t.datetime :date_patron_deliverables_complete
      t.text :email # Content of email sent to patron at the time of order delivery

      t.timestamps
    end
    
    add_index :orders, :customer_id
    add_index :orders, :agency_id
    add_index :orders, :dvd_delivery_location_id
    add_index :orders, :order_status
    add_index :orders, :date_request_submitted
    add_index :orders, :date_due
    add_index :orders, :date_archiving_complete
    add_index :orders, :date_order_approved

    add_foreign_key :orders, :customers
  end
end