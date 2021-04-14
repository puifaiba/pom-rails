User.destroy_all

user1 = User.create!(email: "test@test.com", password: "password1", first_name: "Polly", last_name: "Wolly", role: 1)
user2 = User.create!(email: "tester@test.com", password: "password2", first_name: "Choppo", last_name: "Whoppo", role: 1)
user3 = User.create!(email: "testing@test.com", password: "password3", first_name: "Ravi", last_name: "Wavi", role: 0, therapist_id: user1.id)
user4 = User.create!(email: "tests@test.com", password: "password4", first_name: "Pepe", last_name: "Wepe", role: 0, therapist_id: user2.id)

# task1 = Task.create!(name: "Final Project", description: "A Rails/React app", due_date: Time.now, status: "In progress", user_id: user3.id)
# task2 = Task.create!(name: "Final Project", description: "A Rails/React app", due_date: Time.now, status: "Done", user_id: user4.id)

# interval1 = Interval.create!(date: Time.now, focus_duration: 25, break_duration: 5, long_break_duration: 15, category: "work", on_task: true, comment: "completed on time", task_id: task1.id)
# interval2 = Interval.create!(date: Time.now, focus_duration: 30, break_duration: 15, long_break_duration: 30, category: "study", on_task: false, diversion: "social media", comment: "completed on time", task_id: task2.id)

chat1 = Chat.create!(name: "Ravi")
chat2 = Chat.create!(name: "Pepe")

message1 = Message.create!(chat_id: chat1.id, user_id: user3.id, content: "Hey, how did it go?")
message2 = Message.create!(chat_id: chat1.id, user_id: user1.id, content: "Not terrible")