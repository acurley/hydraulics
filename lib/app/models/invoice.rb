# == Schema Information
#
# Table name: invoices
#
#  id                       :integer         not null, primary key
#  order_id                 :integer
#  date_invoice_sent        :datetime
#  fee_amount_paid          :decimal(, )
#  date_second_invoice_sent :datetime
#  notes                    :text
#  invoice_copy             :binary(2097152)
#  created_at               :datetime
#  updated_at               :datetime
#

class Invoice < ActiveRecord::Base

  belongs_to :order, :counter_cache => true

  #------------------------------------------------------------------
  # relationships
  #------------------------------------------------------------------
 
  #------------------------------------------------------------------
  # validations
  #------------------------------------------------------------------
 
  #------------------------------------------------------------------
  # callbacks
  #------------------------------------------------------------------

  #------------------------------------------------------------------
  # scopes
  #------------------------------------------------------------------  
 
  #------------------------------------------------------------------
  # public class methods
  #------------------------------------------------------------------
 
  #------------------------------------------------------------------
  # public instance methods
  #------------------------------------------------------------------

end