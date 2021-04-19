User.destroy_all
Chat.destroy_all
Message.destroy_all
Column.destroy_all
Task.destroy_all

user1 = User.create!(email: "polly@test.com", password: "password1", first_name: "Polly", last_name: "Wolly", role: 1)
user2 = User.create!(email: "choppo@test.com", password: "password2", first_name: "Choppo", last_name: "Whoppo", role: 1)
user3 = User.create!(email: "ravi@test.com", password: "password3", first_name: "Ravi", last_name: "Wavi", role: 0, therapist_id: user1.id)
user4 = User.create!(email: "pepe@test.com", password: "password4", first_name: "Pepe", last_name: "Wepe", role: 0, therapist_id: user2.id)

# task1 = Task.create!(name: "Final Project", description: "A Rails/React app", due_date: Time.now, status: "In progress", user_id: user3.id)
# task2 = Task.create!(name: "Final Project", description: "A Rails/React app", due_date: Time.now, status: "Done", user_id: user4.id)

# interval1 = Interval.create!(date: Time.now, focus_duration: 25, break_duration: 5, long_break_duration: 15, category: "work", on_task: true, comment: "completed on time", task_id: task1.id)
# interval2 = Interval.create!(date: Time.now, focus_duration: 30, break_duration: 15, long_break_duration: 30, category: "study", on_task: false, diversion: "social media", comment: "completed on time", task_id: task2.id)

chat1 = Chat.create!(name: "Ravi")
chat2 = Chat.create!(name: "Pepe")

message1 = Message.create!(chat_id: chat1.id, user_id: user3.id, content: "Hey, how did it go?")
message2 = Message.create!(chat_id: chat1.id, user_id: user1.id, content: "Not terrible")

columns = [
    {
        label: "TO-DO",
        value: "to_do"
    },
    {
        label: "IN PROGRESS",
        value: "in_progress"
    },
    {
        label: "REVIEW",
        value: "review"
    },
    {
        label: "DONE",
        value: "done"
    },
]

columns.each do |column|
    Column.create!(label: column[:label], value: column[:value])
end

tasks = [
  {
    title: "Add discount code to checkout page",
    date: "2020-12-14",
    tag: "Feature Request",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Provide documentation on integrations",
    date: "2021-01-12",
    tag: "Backend",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Design shopping cart dropdown",
    date: "2021-01-09",
    tag: "Design",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Test checkout flow",
    date: "2021-09-15",
    tag: "QA",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Design wishlist overview",
    date: "2021-01-09",
    tag: "Design",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Add paypal as a payment provider",
    date: "2021-01-14",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Update documentation on products endpoint",
    date: "2021-01-19",
    tag: "Backend",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user3.id
  },
  {
    title: "Design products carousel",
    date: "2021-01-10",
    tag: "Design",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user3.id
  },
  {
    title: "Add related products section",
    date: "2021-01-14",
    tag: "Feature Request",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user3.id
  },
  {
    title: "Design wishlist dropdown",
    date: "2021-01-09",
    tag: "Design",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user3.id
  },
  {
    title: "Add new properties to products endpoint",
    date: "2021-01-14",
    tag: "Backend",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user4.id
  },
  {
    title: "Prepare product meeting",
    date: "2021-01-14",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user4.id
  },
  {
    title: "Design discount code for checkout page",
    date: "2021-01-12",
    tag: "Design",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user4.id
  }
]

tasks.each do |task|
    Task.create!(title: task[:title], date: task[:date], tag: task[:tag], column_id: task[:column_id], user_id: task[:user_id])
end
