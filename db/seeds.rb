craig = User.create(name: "Craig", email: "craig@meow.com", profile_bio: "Just a cool cat who loves reading and writing", password: "guest")
kona = User.create(name: "Kona", email: "kona@meow.com", profile_bio: "Just as cool cat who also loves reading and writing", password: "guest")

Post.create(title: "A Day in the Life of Meow", author: "Robert Frost", review: "It was truly early in the morning when lorem ipsum the lorem ipsum swiggity swag whoot I am a cool cat meow mewo.", user_id: craig.id)
Post.create(title: "A Real Day in the Life of Meow", author: "Francois Benoit", review: "It was even earlier in the morning when lorem ipsum the lorem ipsum swiggity swag whoot I am a cool cat meow me0w.", user_id: kona.id)
Post.create(title: "Frequent", author: "Test", review: "It was meow me me meow.", user_id: kona.id)