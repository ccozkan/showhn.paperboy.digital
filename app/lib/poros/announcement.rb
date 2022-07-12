module Poros
  class Announcement
    def initialize(subject:, body:)
      @subject = subject
      @body = body
    end

    def formatted
      { 'subject': @subject, 'body': @body}.to_json
    end
  end
end
