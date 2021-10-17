class Endpoint < ApplicationRecord
  # Validations
  validates :verb, :path, :response, presence: true
  validates :verb, inclusion: { in: VALID_VERBS, message: "%{value} is not a valid verb"  }, if: -> { verb.present? }
  validates_uniqueness_of :path
  validate :validate_response_schema, if: -> { response.present? }

  # Callbacks
  before_validation :upcase_verb


  def response_schema_valid?
    JSON::Validator.validate(response_schema, response)
  end

  private

  def upcase_verb
    self.verb = verb&.upcase&.strip
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

  def validate_response_schema
    return true if response_schema_valid?

    errors.add(:response, 'is invalid, must contain code with integer value')
  end 
end
