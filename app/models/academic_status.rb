class AcademicStatus < ActiveRecord::Base
  #------------------------------------------------------------------
  # relationships
  #------------------------------------------------------------------
  has_many :customers
  has_many :orders, :through => :customers
  has_many :requests, :through => :customers, :conditions => ['orders.order_status = ?', 'requested']
  has_many :units, :through => :orders
  has_many :master_files, :through => :units
 
  #------------------------------------------------------------------
  # validations
  #------------------------------------------------------------------
  validates :name, :presence => true
 
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
