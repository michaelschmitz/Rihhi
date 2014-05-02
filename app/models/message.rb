class Message < ActiveRecord::Base
  
  
  validates_presence_of :receiver_id, :message => I18n.t("models.message.s1")
  validates_presence_of :title, :message => I18n.t("models.message.s2")
  validates_presence_of :message, :message => I18n.t("models.message.s3")
end
