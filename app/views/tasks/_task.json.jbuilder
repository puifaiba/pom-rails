json.extract! task, :id, :title, :date, :tag, :column_id, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
