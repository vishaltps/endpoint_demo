module SchemaValidatorService
  class << self
    def attributes_schema_valid?(attributes)
      JSON::Validator.validate(response_schema, attributes)
    end

    def response_schema
      {
        "type" => 'object',
        "required" => %w[code],
        "properties" => {
          "code" => { "type" => "integer" },
          "headers" => {"type" => "object"},
          "body" => {"type" => "object"}
        }
      }
    end
  end
end