# Old Title: Film Fanatic(A movie reviewing app)
# New Title: ChefTable

#### SECTION: 3

|     Name        |    ID       |
| --------------- | ----------- |
| Yanet Mekuria   | UGR/7313/13 |
| Yohannes Dessie | UGR/7612/13 |
| Amanuel Beyene  | UGR/1157/13 |
| Gelila Moges    | UGR/5888/13 |
| Feven Tesfaye   | UGR/7905/13 |

## Brief Description for old title

Film Fanatic is the ultimate mobile app for movie enthusiasts and anyone who wants to stay up-to-date on the latest and greatest in cinema. Film Fanatic gives users the platform to post reviews on their favorite movies. It will have two business features: Movie Panels and Reviews. Movie panels are panels dedicated to a specific movie, They hold data about the movie and also the reviews on the movie. Reviews are rating and a short paragraph by users on a specific movie. While all users have full CRUD ability on reviews and can view all movies, only Admins(users with admin role) have full CRUD capabilities on movie panels. In other words only admins can post( or edit or delete for that matter) movie panels; whereas any user(regardless of their role) can post a review. Whether you're a casual moviegoer or a dedicated film fanatic, Film Fanatic offers a user-friendly platform for sharing your opinions on movies and seeing what others think of them.



## Description and feature list for ChefTable
ChefTable is a platform for chefs to share their recipes with fellow food enthusiasts. Food enthusiasts can leave a rating and review on these recipes that will impact how many more people a recipe will reach. Now you might ask why would the chefs take time out of their busy days to post a recipe, well in the cutthroat market that is the resturant industry getting discovered is the hardest stage in the business but with our help chefs can cultivate a following and establish a deeper relationship with their soon-to-be long-term customers. Getting to the programming side of things,

- Our application will have the following Authorization levels:
  1. ADMIN: has full crud capabilities on all features
  2. Chefs: has full crud on their own Recipes(see below for description) and Ratings and Reveiws(see below for description), But only have read and update privileges    on Restuarant(see below for description) feature.
  3. users: have full crud capabilities on their own Ratings and Reviews(see below for description), But can only view Recipes and Restuarants.

- Our application will have the following features:
  1. Recipes: have a couple of attributes within them like a photo of the finished food, ingredients, and procedures. All users can view recipes that are already posted but only users with the authorization level of CHEF can create, edit, and delete recipes.
  2. Restaurants: have a couple of attributes like an address, a rating based on collective users(normal or chefs) rating, chefs hired by them, and house's special foods. Only users with ADMIN level access can create, delete resturant information but chefs can also edit resturant information(When they get hired or fired). All users can view restuarants.
  3. Reviews and Ratings: Review has two attributes a mark out of ten and a short comment about the recipe it is posted under. and Rating is referring to the fact that users can rate restaurants out of ten.
