# Create 2 events
Event.create(name: 'Event 1', description: 'Event 1', start_date: Date.today, end_date: Date.today+7)
Event.create(name: 'Event 2', description: 'Event 2', start_date: Date.today+1, end_date: Date.today+8)

# Create 2 locations
Location.create(name: 'Location 1', description: 'Lied Library', tag: (('A'..'Z').to_a + ('a'..'z').to_a + (0..9).to_a).shuffle[0..7].join, coordinates: '36.107117, -115.142336')
Location.create(name: 'Location 2', description: 'Engineering Bldg', tag: (('A'..'Z').to_a + ('a'..'z').to_a + (0..9).to_a).shuffle[0..7].join, coordinates: '36.110143, -115.141500')

# Create 2 users
User.create(first_name: 'User 1', last_name: 'John Doe', email: 'johndoe@unlv.nevada.edu')
User.create(first_name: 'User 2', last_name: 'Jane Doe', email: 'janedoe@unlv.nevada.edu')

user1=User.find(1)
event1=Event.find(1)
loc1=Location.find(1)
loc2=Location.find(2)
# User 1 is the owner of Event 1 and Locations 1 and 2
user1.owned_events << event1 # updating user_id foreign key for event1 in events
user1.owned_locations << loc1 # updating user_id foreign key for loc1 in locations
user1.owned_locations << loc2 # updating user_id foreign key for loc2 in locations

# Locations 1 and 2 belong to Event 1
event1.locations << loc1 << loc2 

# User 2 is a participant of Event 1 and has already visited Location 1
user2=User.find(2)
user2.participating_events << event1
user2.visited_locations << loc1