json.array!(@problems) do |problem|
  json.extract! problem, :id, :title, :content, :user_id, :category
  json.url problem_url(problem, format: :json)
end
