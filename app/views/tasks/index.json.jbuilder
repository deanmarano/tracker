json.array!(@tasks) do |task|
  json.extract! task, :author_id, :type_id, :notes, :status_id, :index, :points
  json.url task_url(task, format: :json)
end
