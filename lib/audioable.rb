module Audioable
  
  extend ActiveSupport::Concern

  included do
    has_many :audios, :as => :audioable
    accepts_nested_attributes_for :audios, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  end

  module ClassMethods
    
  end

  module InstanceMethods
    
  end
  
end