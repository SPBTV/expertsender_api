module ExpertSenderApi::Email
  class Content
    include ::ExpertSenderApi::Serializeable

    attr_accessor :from_name, :from_email, :reply_to_name, :reply_to_email,
                  :subject, :html, :plain

    def initialize(parameters = {})
      parameters.each { |key, value| send("#{key}=", value) }
    end

    def insert_to(xml)
      xml.Content do
        attributes.each do |attr|
          xml.send(attr[:name], attr[:value]) unless attr[:value].nil?
        end
      end
    end
  end
end
