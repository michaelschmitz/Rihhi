class Size < ActiveRecord::Base
  belongs_to :listing
  
  def add_error(message)
    logger.info("inside the message")
    errors.add_to_base(message.to_s)
  end
  
end
