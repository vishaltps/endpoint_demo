FactoryBot.define do
  factory :endpoint do
    verb { 'GET' }
    path { 'dummy_path' }
    response { { code: 200 } }
  end
end