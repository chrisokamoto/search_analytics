FactoryGirl.define do
  factory :search_analytic do
    article_title { 'How do I cancel my subscription?' }
    quantity      { 1 }
  end

  factory :search_analytic_quantity_2, parent: :search_analytic do
    article_title { 'What is my account number?' }
    quantity      { 2 }
  end
end
