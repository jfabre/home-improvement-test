# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin user
admin = User.create(email: 'admin@example.com', full_name: 'Admin', password: 'admin', image: 'https://robohash.org/admin-2?set=set3', role: :admin)

# Created regular user
user = User.create(email: 'user@example.com', full_name: 'John Smith', password: Devise.friendly_token[0,20], image: 'https://robohash.org/user-john-smith?set=set3', role: :user)

project = Project.create(
  owner: user,
  name: 'Wallpaper one wall',
  description: 'Begin by taking a photo of your existing room and measuring its dimensions. Take these with you to the interior design or wall-covering store. Ask a specialist to help sort through options that’ll work well with your existing furnishings. The specialist will also help you pick the best wall for the new paper and estimate the amount to order.',
  type: 'public',
  status: 'started',
  estimated_effort_level: 6
)
project.comments.create({user: user, body: 'I think this is a great idea'})

# Create public projects
Project.create(
  owner: admin,
  name: 'Bathroom mini makeover',
  description: 'Begin by ordering your new items and don’t start the project until you have them all on hand. Be sure to inspect them for flaws (a common problem). Then tear out the old fixtures and repair the walls as needed. Keep the old vanity if it’s in good shape. But paint it to freshen it. Use a few cans of spray paint to get a smooth finish and avoid brush marks. And replace the old pulls with new ones to dress it up.
  
  Next, paint the walls and add the new mirror. If your old mirror included a recessed medicine cabinet, make sure the new one fits within the existing opening. Enlarging the opening often expands the job considerably!
  
  Finally, mount the faucet, install your new granite top and connect the plumbing. Whew! If all goes well, you’ll finish in a long weekend.',
  type: 'public',
  estimated_effort_level: 24
)

Project.create(
  owner: admin,
  name: 'New bath accessories',
  description: 'Replacing accessories like towel bars, light fixtures and towels, plus applying a fresh coat of paint, is the absolutely easiest way to make your bathroom feel new and clean. You don’t need special skills for success; it’s a screwdriver- and-paintbrush project you can complete in a weekend. But keep in mind that this face-lift will only work if your basic fixtures—the sink and faucet, vanity, toilet, tub and tile—are all still in reasonably good shape.',
  type: 'private',
  status: 'started',
  estimated_effort_level: 8,
  actual_effort_level: 10
)

Project.create(
  owner: admin,
  name: 'Trim and paint',
  description: 'By adding two simple lines of trim—a chair rail and a crown molding—you create the perfect framework for any handsome two-color wall combination. This is one of the secrets of fast, easy redecorating.
  
  To have the biggest color impact, paint your trim. This also simplifies installation. You don’t have to cut perfect joints, because a little filler and paint will leave them looking sharp and crisp. You can also use less expensive materials.
  
  The trim combination we show looks best in rooms with at least 4-1/2-in.-tall baseboards. If your baseboard is narrower, consider replacing it or choosing a different wall decorating technique. (See “Wallpaper one wall” above.)',
  type: 'private',
  status: 'completed',
  estimated_effort_level: 24
)

