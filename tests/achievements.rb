require '../achievements.rb'

test_user1 = {
  'value' => {
    'ownedforks' => 100,
    'ownedlangs' => 3,
    'ownedwatchers' => 200
  }
}

test_user2 = {
  'value' => {
    'ownedlangs' => 3,
    'ownedwatchers' => nil
  }
}

test_user3 = {}

Achievements.new().get_user_achievements(test_user1)
Achievements.new().get_user_achievements(test_user2)
Achievements.new().get_user_achievements(test_user3)
