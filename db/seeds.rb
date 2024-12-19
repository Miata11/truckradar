require "open-uri"
# Configure Geocoder to do nothing during seed
Geocoder.configure(lookup: :null)

# Coordonnées de Le Teich
LE_TEICH_LAT = 44.6375
LE_TEICH_LON = -1.0246

# Méthode pour générer des coordonnées autour de Le Teich
def generate_coordinates_around_le_teich
  # Approximativement 0.1 degré = ~11km
  radius = 0.09  # légèrement inférieur pour rester dans un rayon de 10km

  # Génération aléatoire dans un cercle
  r = radius * Math.sqrt(rand)
  theta = rand * 2 * Math::PI

  lat = LE_TEICH_LAT + r * Math.cos(theta)
  lon = LE_TEICH_LON + r * Math.sin(theta)

  [lat, lon]
end

# Arrays for random selection
CITIES = [
  ["Paris", 48.8566, 2.3522],
  ["Lyon", 45.7640, 4.8357],
  ["Marseille", 43.2962, 5.3700],
  ["Toulouse", 43.6047, 1.4442],
  ["Nice", 43.7102, 7.2620],
  ["Nantes", 47.2184, -1.5536],
  ["Montpellier", 43.6108, 3.8767],
  ["Strasbourg", 48.5734, 7.7521],
  ["Bordeaux", 44.8378, -0.5792],
  ["Lille", 50.6292, 3.0573],
  ["Rennes", 48.1173, -1.6778],
  ["Reims", 49.2628, 4.0347],
  ["Le Mans", 47.9956, 0.1907],
  ["Saint-Étienne", 45.4397, 4.3879],
  ["Toulon", 43.1242, 5.9280],
  ["Grenoble", 45.1885, 5.7245],
  ["Dijon", 47.3223, 5.0415],
  ["Angers", 47.4739, -0.5515],
  ["Brest", 48.4066, -4.4960],
  ["Le Havre", 49.4944, 0.1076],
  ["Orléans", 47.9034, 1.9062],
  ["Bourges", 47.0840, 2.3937],
  ["Blois", 47.5846, 1.3272],
  ["Châteauroux", 46.8146, 1.6953],
  ["Tours", 47.3942, 0.6896]
]

FOOD_CATEGORIES = ["asiatique", "mexicain", "végétarien", "burger", "italien", "cuisine de saison", "barbecue", "poisson", "vegan"]
FOOD_NAMES = [
  "Le Truck Gourmand",
  "Street Food Nation",
  "Roulant Délice",
  "Cuisine Mobile",
  "Flavors on Wheels",
  "Le Camion Gourmet",
  "Urban Bites",
  "Foodie Express",
  "Saveurs Nomades",
  "Le Chef Vagabond"
]

DISH_TITLES = [
  "Plat Signature",
  "Classic Burger",
  "Tacos Spéciaux",
  "Salade Fraîcheur",
  "Burger du Jour",
  "Pizza Artisanale",
  "Veggie Bowl",
  "Sandwich Gourmet",
  "Plat du Chef",
  "Street Food Royale"
]

STOCK_PHOTOS = [
  "https://otuktuk.fr/wp-content/uploads/2017/10/o_tuk_tuk_fodd_truck_toulouse_slider.jpg",

  "https://images.unsplash.com/photo-1633260682035-b6270ab1b314?q=80&w=1951&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1651822841710-3b7f17ed0d34?q=80&w=1975&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1714158008549-26044a1c0e5b?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1633779453800-05e39f2d1fef?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1716172936090-e4d295ce2c5a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1672425920956-c989e920fe90?q=80&w=2068&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1680546882132-e512ef9290d3?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1672767775752-b457456f8980?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1624041627508-231ad24af642?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1620589125156-fd5028c5e05b?q=80&w=2087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1637708546585-5bbdeccc3bee?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1711356055270-a07293af9be5?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1692980176182-2eefa1807e28?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1709398499829-f95ebe6aad9a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1722101202709-e574360b9b55?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1715654226080-74194531ecca?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1693039434590-5eaee1a3de29?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://media.istockphoto.com/id/617880604/fr/photo/nourriture-de-rue-dans-le-parc.webp?a=1&b=1&s=612x612&w=0&k=20&c=GVSfnFKswo9K5ZHbxXEn4cI3xTwfCw6d3uYx_jWwrHw=",
  "https://images.unsplash.com/reserve/DHHQbqc0RrWVf0uDNe5E_The%20Litte%20Cafe.jpg?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Q2FtaW9uJTIwZGUlMjBjdWlzaW5lJTIwZGUlMjBydWV8ZW58MHx8MHx8fDA%3D",
  "https://media.istockphoto.com/id/988321954/fr/photo/camion-de-nourriture-de-jeunes-entrepreneurs.webp?a=1&b=1&s=612x612&w=0&k=20&c=2AABUuZNIXf-cFIXUkzL1aBycw5u3J2YzJrG5dV4SAo=",
  "https://les-seminaires.eu/wp-content/uploads/2023/07/food-truck-entreprise.jpg",
  "https://static.wixstatic.com/media/b45c09_d3b790add4cc4097afd338d22fe0f774~mv2.jpg/v1/fill/w_510,h_638,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/IMG_20240911_101704.jpg",
  "https://static.wixstatic.com/media/369974_4b44793445374aee8e776c139cb8eedb~mv2.jpg/v1/crop/x_0,y_27,w_960,h_585/fill/w_434,h_270,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/369974_4b44793445374aee8e776c139cb8eedb~mv2.jpg"
]

DISH_PHOTOS = [
  "https://cdn.shopify.com/s/files/1/0605/9720/7189/files/20240821143137-img_1429.jpg?v=1724250702&width=1600&height=900",
  "https://www.cuisineactuelle.fr/imgre/fit/~1~cac~2023~01~17~999fccbd-d5ad-4cc2-91ba-d5a06206b882.jpeg/650x325/quality/80/crop-from/center/galette-de-sarrasin-a-l-ancienne.jpg",
  "https://www.ma-grande-taille.com/wp-content/uploads/2020/01/Une-idee-recettes-salees-sucrees-vegan-chandeleur-2020.jpg"
]

FIRST_NAMES = ["Sophie", "Emma", "Léa", "Julie", "Thomas", "Antoine", "Lucas", "Pierre", "Alexandre", "Nicolas"]
LAST_NAMES = ["Dubois", "Martin", "Bernard", "Petit", "Laurent", "Garcia", "Rodriguez", "Moreau", "Simon", "Lefebvre"]

# Destroy existing records to start fresh
Dish.destroy_all
Favorite.destroy_all
Foodtruck.destroy_all
User.destroy_all

# Existing profiles to preserve
user1 = User.create!(
  first_name: "Max",
  last_name: "El Poirier",
  email: "max@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves, Bordeaux",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "false")

user2 = User.create!(
  first_name: "Soukaina",
  last_name: "El Ataoui",
  email: "soukaina@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves, Bordeaux",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "false")

user_pro1 = User.create!(
  first_name: "Claire",
  last_name: "Cagnat",
  email: "claire@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves, Bordeaux",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "true")

user_pro2 = User.create!(
  first_name: "Charline",
  last_name: "Menant",
  email: "charline@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves, Bordeaux",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "true")

# Existing food trucks
foodtruck1 = Foodtruck.create!(
  name: "Sando Truck",
  phone_number: "07 66 28 54 36",
  categories: ["asiatique"],
  description: "Une culture japonaise avant tout... Les sando, mais c'est quoi ? Inspiré de la culture japonaise, ce sandwich japonais XXL aux tranches de pain de mie et à la garniture généreuse est une recette de street-food emblématique du Japon.",
  address_default: "Gare de Bordeaux",
  latitude: 44.823462,
  longitude: -0.556544,
  status: true,
  horaires: "12:00 à 15:00",
  jours: "Lundi, Jeudi",
  user: user_pro1
)

# Attacher une photo au Sando Truck
file = URI.open(STOCK_PHOTOS.first)
foodtruck1.photo.attach(io: file, filename: "sando_truck.jpg", content_type: "image/jpg")
foodtruck1.save

# Créer 2 plats pour le Sando Truck
2.times do |j|
  dish = Dish.new(
    foodtruck: foodtruck1,
    title: DISH_TITLES.sample,
    description: "Salade, tomate, oignons, sauce Biggy",
    price: rand(8.50..18.50).round(2)
  )

  # Attacher une photo aléatoire de plat
  file = URI.open(DISH_PHOTOS.sample)
  dish.photo.attach(io: file, filename: "dish_sando_truck_#{j}.jpg", content_type: "image/jpg")
  dish.save
end

# Créer des reviews pour le Sando Truck
existing_review_users = [user1, user2, user_pro2]
existing_review_users.each do |user|
  Review.create(
    foodtruck_id: foodtruck1.id,
    user_id: user.id,
    comment: ["Super food truck, je recommande!", "Une expérience culinaire délicieuse!", "Très bon rapport qualité-prix", "Le Top du Top !", "J'ai beaucoup aimé", "Ils sont super sympa"].sample,
    rating: rand(3..5)
  )
end

foodtruck2 = Foodtruck.create!(
  name: "Le Van Foodtruck",
  phone_number: "07 69 63 28 30",
  categories: ["crêperie"],
  description: "Fondatrice du food-truck, Lolita souhaite moderniser la façon de servir les galettes et les crêpes mais aussi la façon de les cuisiner.",
  address_default: "Esplanade . Arrêt Tram Montaigne Montesquieu - Pessac",
  latitude: 44.81011,
  longitude: -0.64129,
  status: true,
  horaires: "19:00 à 22:30",
  jours: "mardi, vendredi",
  user: user_pro2
)
file = URI.open(STOCK_PHOTOS.last)
foodtruck2.photo.attach(io: file, filename: "le_van_truck.jpg", content_type: "image/jpg")
foodtruck2.save

# Créer 2 plats pour Le Van Foodtruck
2.times do |j|
  dish = Dish.new(
    foodtruck: foodtruck2,
    title: DISH_TITLES.sample,
    description: "Salade, tomate, oignons, sauce Biggy",
    price: rand(8.50..18.50).round(2)
  )

  # Attacher une photo aléatoire de plat
  file = URI.open(DISH_PHOTOS.sample)
  dish.photo.attach(io: file, filename: "dish_le_van_#{j}.jpg", content_type: "image/jpg")
  dish.save
end

# Créer des reviews pour Le Van Foodtruck
existing_review_users.each do |user|
  Review.create(
    foodtruck_id: foodtruck2.id,
    user_id: user.id,
    comment: ["Super food truck, je recommande!", "Une expérience culinaire délicieuse!", "Très bon rapport qualité-prix"].sample,
    rating: rand(3..5)
  )
end

# Génération des nouveaux food trucks
55.times do |index|
  # Définir la condition Le Teich avant son utilisation
  le_teich_description = index <= 5 ?
    "Food truck spécialisé dans la cuisine locale des environs du Bassin d'Arcachon." :
    nil

  # Sélection des coordonnées
  if index <= 5
    latitude, longitude = generate_coordinates_around_le_teich
    city = "Le Teich et environs"
  else
    city, latitude, longitude = CITIES.sample
  end

  # Création de l'utilisateur professionnel
  user_pro = User.create!(
    first_name: FIRST_NAMES.sample,
    last_name: LAST_NAMES.sample,
    email: "pro_new_#{index}@example.com",
    password: "123456",
    address_default: "#{rand(1..200)} rue de #{city}",
    latitude: latitude + rand(-0.1..0.1),
    longitude: longitude + rand(-0.1..0.1),
    role: "true"
  )

  # Création du food truck
  foodtruck = Foodtruck.create!(
    name: FOOD_NAMES.sample,
    phone_number: "0#{rand(6..7)} #{rand(10..99)} #{rand(10..99)} #{rand(10..99)} #{rand(10..99)}",
    categories: FOOD_CATEGORIES.sample(rand(1..2)),
    description: le_teich_description || "Un food truck unique proposant une cuisine #{FOOD_CATEGORIES.sample} de qualité dans les rues de #{city}.",
    address_default: "#{rand(1..200)} rue de #{city}",
    latitude: latitude,
    longitude: longitude,
    status: [true, false].sample,
    horaires: rand(11..14).to_s + ":00 à " + rand(19..22).to_s + ":30",
    jours: ["Lundi, Mercredi", "Mardi, Jeudi", "Vendredi, Samedi", "Dimanche"].sample,
    user: user_pro
  )

  # Attacher une photo aléatoire
  file = URI.open(STOCK_PHOTOS.sample)
  foodtruck.photo.attach(io: file, filename: "foodtruck_new_#{index}.jpg", content_type: "image/jpg")
  foodtruck.save

  # Même chose pour les plats
  le_teich_dish_description = index <= 5 ?
    "Huîtres chaudes, salade, tomate, oignons" :
    nil

  # Créer 2 plats pour chaque food truck
  2.times do |j|
    dish = Dish.new(
      foodtruck: foodtruck,
      title: DISH_TITLES.sample,
      description: le_teich_dish_description || "Salade, tomate, oignons, sauce Biggy",
      price: rand(8.50..18.50).round(2)
    )

    # Attacher une photo aléatoire de plat
    file = URI.open(DISH_PHOTOS.sample)
    dish.photo.attach(io: file, filename: "dish_new_#{index}_#{j}.jpg", content_type: "image/jpg")
    dish.save
  end

  # Créer des reviews pour chaque food truck
  le_teich_review_comment = index <= 5 ?
    ["Découverte culinaire autour du Bassin d'Arcachon !", "Une adresse à ne pas manquer près du Teich"].sample :
    nil

  existing_review_users.each do |user|
    review_comment = le_teich_review_comment.to_s if le_teich_review_comment.present?
    review_comment ||= ["Super food truck, je recommande!", "Une expérience culinaire délicieuse!", "Très bon rapport qualité-prix"].sample
    Review.create(
      foodtruck_id: foodtruck.id,
      user_id: user.id,
      comment: review_comment,
      rating: rand(3..5)
    )
  end
end

puts "Seed terminé avec succès !"
