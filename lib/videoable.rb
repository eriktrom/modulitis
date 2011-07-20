module Videoable
  
  extend ActiveSupport::Concern

  included do
    has_many :videos, :as => :videoable, :dependent => :destroy
    accepts_nested_attributes_for :videos, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  end

  module ClassMethods
    
  end

  module InstanceMethods
    
  end
  
end