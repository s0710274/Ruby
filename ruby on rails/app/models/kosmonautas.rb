class Kosmonautas < ActiveRecord::Base
  belongs_to :erdvelaivis
  belongs_to :stotis
  belongs_to :centras
end
