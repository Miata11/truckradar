require "open-uri"
# On configure Geocoder pour ne rien faire pendant le seed
Geocoder.configure(lookup: :null)

Dish.destroy_all
Favorite.destroy_all
Foodtruck.destroy_all
User.destroy_all


user1 =  User.create!(
  first_name: "Claire",
  last_name: "Cagnat",
  email: "claire@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "false")

user1 =  User.create!(
  first_name: "Soukaina",
  last_name: "El Ataoui",
  email: "soukaina@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "false")

user_pro1 =  User.create!(
  first_name: "Max",
  last_name: "El Poirier",
  email: "max@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "true")

user_pro2 =  User.create!(
  first_name: "Charline",
  last_name: "Menant",
  email: "charline@gmail.com",
  password: "123456",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "true")

user_pro3 = User.create!(
 first_name: "Sophie",
 last_name: "Dubois",
 email: "sophie.dubois@gmail.com",
 password: "123456",
 address_default: "45 rue Saint-Rémi, Bordeaux",
 latitude: 44.841657,
 longitude: -0.571952,
 role: "true"
)

user_pro4 = User.create!(
 first_name: "Thomas",
 last_name: "Martin",
 email: "thomas.martin@gmail.com",
 password: "123456",
 address_default: "25 rue du Palais Gallien, Bordeaux",
 latitude: 44.848234,
 longitude: -0.578901,
 role: "true"
)

user_pro5 = User.create!(
 first_name: "Julie",
 last_name: "Petit",
 email: "julie.petit@gmail.com",
 password: "123456",
 address_default: "156 cours Victor Hugo, Bordeaux",
 latitude: 44.832145,
 longitude: -0.569872,
 role: "true"
)

user_pro6 = User.create!(
 first_name: "Lucas",
 last_name: "Bernard",
 email: "lucas.bernard@gmail.com",
 password: "123456",
 address_default: "89 rue Notre Dame, Bordeaux",
 latitude: 44.857123,
 longitude: -0.558934,
 role: "true"
)

user_pro7 = User.create!(
 first_name: "Emma",
 last_name: "Rousseau",
 email: "emma.rousseau@gmail.com",
 password: "123456",
 address_default: "12 place Gambetta, Bordeaux",
 latitude: 44.842789,
 longitude: -0.577456,
 role: "true"
)

  foodtruck1 = Foodtruck.create!(
    name: "Sando Truck",
    phone_number: "07 66 28 54 36",
    category: "asiatique",
    description: "Une culture japonaise avant tout...Les sando, mais c'est quoi ? Inspiré de la culture japonaise, ce sandwich japonais XXL aux tranches de pain de mie et à la garniture généreuse est une recette de street-food emblématique de Japon",
    address_default: "Gare de Bordeaux",
    latitude: 44.823462,
    longitude: -0.556544,
    status: true,
    user: user_pro1)
  file = URI.open("https://otuktuk.fr/wp-content/uploads/2017/10/o_tuk_tuk_fodd_truck_toulouse_slider.jpg")
  foodtruck1.photo.attach(io: file, filename: "sando_truck.jpg", content_type: "image/jpg")
  foodtruck1.save


  # Le Van Foodtruck
  foodtruck2 = Foodtruck.create!(
   name: "Le Van Foodtruck",
   phone_number: "07 69 63 28 30",
   category: "crêperie",
   description: "Fondatrice du food-truck, Lolita souhaite moderniser la façon de servir les galettes et les crêpes mais aussi la façon de les cuisiner, en proposant des produits dérivés comme des samoussas à la galette de sarrasin ou des chips de sarrasin.",
   address_default: "Esplanade . Arrêt Tram Montaigne Montesquieu - Pessac",
   latitude: 44.81011,
   longitude: -0.64129,
   status: true,
   user: user_pro2)
  file = URI.open("https://static.wixstatic.com/media/b45c09_d3b790add4cc4097afd338d22fe0f774~mv2.jpg/v1/fill/w_510,h_638,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/IMG_20240911_101704.jpg")
  foodtruck2.photo.attach(io: file, filename: "van_foodtruck.jpg", content_type: "image/jpg")
  foodtruck2.save

  # Truck de chef
  foodtruck3 = Foodtruck.create!(
   name: "Truck de chef",
   phone_number: "06 61 77 68 08",
   category: "fr",
   description: "Une cuisine bistro de qualité, tout en fraîcheur, avec des recettes pratiques à manger, conçues pour être dégustées de façon nomade.",
   address_default: "Square Léonie Bonnet – Floirac",
   latitude: 44.83238,
   longitude: -0.514021,
   status: true,
   user: user_pro3)
  file = URI.open("https://otuktuk.fr/wp-content/uploads/2017/10/o_tuk_tuk_fodd_truck_toulouse_slider.jpg")
  foodtruck3.photo.attach(io: file, filename: "truck_chef.jpg", content_type: "image/jpg")
  foodtruck3.save

  # El taco del diablo
  foodtruck4 = Foodtruck.create!(
   name: "El taco del diablo",
   phone_number: "09 80 80 04 92",
   category: "mexicain/californien",
   description: "La street food et les food trucks étaient notre quotidien à Los Angeles, nous avons voulu à notre retour en France, à Bordeaux, partager notre expérience, et surtout faire connaître aux bordelais les célèbres tacos californiens",
   address_default: "87 Rue Lagrange 33000 BORDEAUX",
   latitude: 44.8524179,
   longitude: -0.581036,
   status: true,
   user: user_pro4)
  file = URI.open("https://static.wixstatic.com/media/369974_4b44793445374aee8e776c139cb8eedb~mv2.jpg/v1/crop/x_0,y_27,w_960,h_585/fill/w_434,h_270,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/369974_4b44793445374aee8e776c139cb8eedb~mv2.jpg")
  foodtruck4.photo.attach(io: file, filename: "taco_diablo.jpg", content_type: "image/jpg")
  foodtruck4.save

  # Yedi Tepe
  foodtruck5 = Foodtruck.create!(
   name: "Yedi Tepe",
   phone_number: "08 90 21 01 68",
   category: "cuisine turque",
   description: "Embarquez pour un voyage de saveurs avec Yepi Tepe, votre food truck spécialisé dans la cuisine turque authentique !",
   address_default: "6 Rue des Comètes - 33185 Le Haillan",
   latitude: 44.8593025,
   longitude: -0.669148,
   status: false,
   user: user_pro5)
  file = URI.open("https://les-seminaires.eu/wp-content/uploads/2023/07/food-truck-entreprise.jpg")
  foodtruck5.photo.attach(io: file, filename: "yedi_tepe.jpg", content_type: "image/jpg")
  foodtruck5.save

  # Seasons food truck
  foodtruck6 = Foodtruck.create!(
   name: "Seasons food truck",
   phone_number: "06 31 86 58 03",
   category: "cuisine de saison",
   description: "Les maîtres mots : le respect des saisons, la sélection des bons produits via les producteurs locaux et l'inspiration brunch de la carte",
   address_default: "place Paul Doumer (Chartrons)",
   latitude: 44.8521802,
   longitude: -0.5737263,
   status: false,
   user: user_pro6)
  file = URI.open("https://www.frankielourdet.com/wp-content/uploads/2023/10/foodtruck-big.jpg")
  foodtruck6.photo.attach(io: file, filename: "seasons_foodtruck.jpg", content_type: "image/jpg")
  foodtruck6.save

  # Dishes pour Sando Truck
  dish1 = Dish.new(
   foodtruck: foodtruck1,
   title: "Veggie Sando",
   description: "Pain de mie toasté, aubergine panée, chou blanc à la vinaigrette maison, sauce tonkatsu",
   price: 12.50
  )
  file = URI.open("https://cdn.shopify.com/s/files/1/0605/9720/7189/files/20240821143137-img_1429.jpg?v=1724250702&width=1600&height=900")
  dish1.photo.attach(io: file, filename: "veggie_sando.jpg", content_type: "image/jpg")
  dish1.save

  # dish2 = Dish.new(
  #  foodtruck: foodtruck1,
  #  title: "Porce Lait",
  #  description: "Pain de mie toasté, porc IGP pané, chou blanc à la vinaigrette maison, sauce tonkatsu",
  #  price: 14.50
  # )
  # file = URI.open("https://kissmychef.com/wp-content/uploads/2022/05/Sando.jpg")
  # dish2.photo.attach(io: file, filename: "porce_lait.jpg", content_type: "image/jpg")
  # dish2.save

  # Dishes pour Le Van Foodtruck
  dish3 = Dish.new(
   foodtruck: foodtruck2,
   title: "Galette de Sarrasin",
   description: "à la fois tendre et délicatement parfumée, servie avec une garniture au choix : fromage, œuf, jambon ou légumes grillés.",
   price: 10.90
  )
  file = URI.open("https://www.cuisineactuelle.fr/imgre/fit/~1~cac~2023~01~17~999fccbd-d5ad-4cc2-91ba-d5a06206b882.jpeg/650x325/quality/80/crop-from/center/galette-de-sarrasin-a-l-ancienne.jpg")
  dish3.photo.attach(io: file, filename: "galette_sarrasin.jpg", content_type: "image/jpg")
  dish3.save

  dish4 = Dish.new(
   foodtruck: foodtruck2,
   title: "Crêpe sucrée",
   description: "Une crêpe sucrée délicatement sucrée, que vous pourrez savourer nature ou accompagnée de garnitures gourmandes comme chocolat, caramel, fruits frais ou crème chantilly.",
   price: 6.50
  )
  file = URI.open("https://www.ma-grande-taille.com/wp-content/uploads/2020/01/Une-idee-recettes-salees-sucrees-vegan-chandeleur-2020.jpg")
  dish4.photo.attach(io: file, filename: "crepe_sucree.jpg", content_type: "image/jpg")
  dish4.save
