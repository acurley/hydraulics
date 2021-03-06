class AvailabilityPolicy < ActiveRecord::Base
  #------------------------------------------------------------------
  # relationships
  #------------------------------------------------------------------
  has_many :bibls
  has_many :components
  has_many :master_files
  has_many :units
 
  #------------------------------------------------------------------
  # validations
  #------------------------------------------------------------------
  validates :name, :xacml_policy_url, :presence => true, :uniqueness => true
  validates :xacml_policy_url, :format => {:with => URI::regexp(['http','https'])}
 
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
