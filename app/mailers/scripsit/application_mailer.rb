module Scripsit
  class ApplicationMailer < ActionMailer::Base
    include ActionView::Helpers::TextHelper
    default from: ENV['MAILER_FROM']
    layout 'mailer'
  end
end
