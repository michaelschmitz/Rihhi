class Flagged < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing  
    
  validates_presence_of :reason, :message => I18n.t("models.flagged.s1")
  validates_length_of   :reason, :if => Proc.new { |u| u.complete == "step1"} && :reason?,:minimum => 5 , :message => I18n.t("models.flagged.s2") 
end
