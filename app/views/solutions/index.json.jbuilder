json.array!(@solutions) do |solution|
  json.extract! solution, :id, :content, :user_id, :problem_id
  json.url solution_url(solution, format: :json)
end
