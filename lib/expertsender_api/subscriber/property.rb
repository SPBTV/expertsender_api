module ExpertSenderApi::Subscriber
  class Property
    attr_accessor :id, :value, :type

    TYPE_INTEGER = 'int'.freeze
    TYPE_STRING = 'string'.freeze
    TYPE_DATE = 'date'.freeze
    TYPE_DATE_TIME = 'dateTime'.freeze

    def initialize(id: nil, value: nil, type: TYPE_STRING)
      @id = id
      @value = value
      @type = type
    end

    def insert_to(xml)
      xml.Property do
        xml.Id id
        xml.Value value, 'xsi:type' => "xs:#{type}"
      end
    end
  end
end
