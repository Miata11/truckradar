
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
  password: "123",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "false")

user1 =  User.create!(
  first_name: "Soukaina",
  last_name: "El Ataoui",
  email: "soukaina@gmail.com",
  password: "123",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "false")

user_pro1 =  User.create!(
  first_name: "Max",
  last_name: "El Poirier",
  email: "max@gmail.com",
  password: "123",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "true")

user_pro2 =  User.create!(
  first_name: "Charline",
  last_name: "Menant",
  email: "charline@gmail.com",
  password: "123",
  address_default: "15 rue des terres neuves",
  latitude: 44.841225,
  longitude: -0.580036,
  role: "true")

  user_pro206 = User.create!(
    first_name: "Nicolas",
    last_name: "Lemoine",
    email: "nicolas.lemoine@example.com",
    password: "123456",
    address_default: "206 rue du Port",
    latitude: 44.654000,
    longitude: -1.078000,
    role: true
  )

user_pro207 = User.create!(
  first_name: "Valérie",
  last_name: "Dupuis",
  email: "valerie.dupuis@example.com",
  password: "123456",
  address_default: "207 rue des Pins",
  latitude: 44.591500,
  longitude: -1.084500,
  role: true
)

user_pro208 = User.create!(
  first_name: "Céline",
  last_name: "Roux",
  email: "celine.roux@example.com",
  password: "123456",
  address_default: "208 rue de l'Océan",
  latitude: 44.630000,
  longitude: -1.076000,
  role: true
)

user_pro209 = User.create!(
  first_name: "Paul",
  last_name: "Leclerc",
  email: "paul.leclerc@example.com",
  password: "123456",
  address_default: "209 rue des Pins",
  latitude: 44.645000,
  longitude: -1.141500,
  role: true
)

foodtruck1 = FoodTruck.new(
  name: "Sando Truck",
  phone_number: "07 66 28 54 36",
  category: "asiatique",
  description: "Une culture japonaise avant tout...Les sando, mais c'est quoi ? Inspiré de la culture japonaise, ce sandwich japonais XXL aux tranches de pain de mie et à la garniture généreuse est une recette de street-food emblématique de Japon",
  address_default: "Gare de Bordeaux",
  latitude: 44.823462,
  longitude: -0.556544,
  status: true,
  user: created_pro)
file = URI.open("https://quoifaireabordeaux.com/wp-content/uploads/2019/05/6PyX-0Qn-1.jpeg")
foodtruck1.photo.attach(io: file, filename: "sando_truck.jpeg", content_type: "image/jpeg")
foodtruck1.save

# Le Van Foodtruck
foodtruck2 = Foodtruck.new(
 name: "Le Van Foodtruck",
 phone_number: "07 69 63 28 30",
 category: "crêperie",
 description: "Fondatrice du food-truck, Lolita souhaite moderniser la façon de servir les galettes et les crêpes mais aussi la façon de les cuisiner, en proposant des produits dérivés comme des samoussas à la galette de sarrasin ou des chips de sarrasin.",
 address_default: "Esplanade . Arrêt Tram Montaigne Montesquieu - Pessac",
 latitude: 44.81011,
 longitude: -0.64129,
 status: true,
 user: created_pro)
file = URI.open("https://static.wixstatic.com/media/b45c09_d3b790add4cc4097afd338d22fe0f774~mv2.jpg/v1/fill/w_510,h_638,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/IMG_20240911_101704.jpg")
foodtruck2.photo.attach(io: file, filename: "van_foodtruck.jpg", content_type: "image/jpg")
foodtruck2.save

# Truck de chef
foodtruck3 = Foodtruck.new(
 name: "Truck de chef",
 phone_number: "06 61 77 68 08",
 category: "fr",
 description: "Une cuisine bistro de qualité, tout en fraîcheur, avec des recettes pratiques à manger, conçues pour être dégustées de façon nomade.",
 address_default: "Square Léonie Bonnet – Floirac",
 latitude: 44.83238,
 longitude: -0.514021,
 status: true,
 user: created_pro)
file = URI.open("https://otuktuk.fr/wp-content/uploads/2017/10/o_tuk_tuk_fodd_truck_toulouse_slider.jpg")
foodtruck3.photo.attach(io: file, filename: "truck_chef.jpg", content_type: "image/jpg")
foodtruck3.save

# El taco del diablo
foodtruck4 = Foodtruck.new(
 name: "El taco del diablo",
 phone_number: "09 80 80 04 92",
 category: "mexicain/californien",
 description: "La street food et les food trucks étaient notre quotidien à Los Angeles, nous avons voulu à notre retour en France, à Bordeaux, partager notre expérience, et surtout faire connaître aux bordelais les célèbres tacos californiens",
 address_default: "87 Rue Lagrange 33000 BORDEAUX",
 latitude: 44.8524179,
 longitude: -0.581036,
 status: true,
 user: created_pro)
file = URI.open("https://static.wixstatic.com/media/369974_4b44793445374aee8e776c139cb8eedb~mv2.jpg/v1/crop/x_0,y_27,w_960,h_585/fill/w_434,h_270,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/369974_4b44793445374aee8e776c139cb8eedb~mv2.jpg")
foodtruck4.photo.attach(io: file, filename: "taco_diablo.jpg", content_type: "image/jpg")
foodtruck4.save

# Yedi Tepe
foodtruck5 = Foodtruck.new(
 name: "Yedi Tepe",
 phone_number: "08 90 21 01 68",
 category: "cuisine turque",
 description: "Embarquez pour un voyage de saveurs avec Yepi Tepe, votre food truck spécialisé dans la cuisine turque authentique !",
 address_default: "6 Rue des Comètes - 33185 Le Haillan",
 latitude: 44.8593025,
 longitude: -0.669148,
 status: false,
 user: created_pro)
file = URI.open("https://les-seminaires.eu/wp-content/uploads/2023/07/food-truck-entreprise.jpg")
foodtruck5.photo.attach(io: file, filename: "yedi_tepe.jpg", content_type: "image/jpg")
foodtruck5.save

# Seasons food truck
foodtruck6 = Foodtruck.new(
 name: "Seasons food truck",
 phone_number: "06 31 86 58 03",
 category: "cuisine de saison",
 description: "Les maîtres mots : le respect des saisons, la sélection des bons produits via les producteurs locaux et l'inspiration brunch de la carte",
 address_default: "place Paul Doumer (Chartrons)",
 latitude: 44.8521802,
 longitude: -0.5737263,
 status: false,
 user: created_pro)
file = URI.open("https://www.frankielourdet.com/wp-content/uploads/2023/10/foodtruck-big.jpg")
foodtruck6.photo.attach(io: file, filename: "seasons_foodtruck.jpg", content_type: "image/jpg")
foodtruck6.save

foodtruck206 = Foodtruck.create!(
  name: "Biganos Grill",
  phone_number: "07 69 63 28 206",
  category: "Grillades",
  description: "Foodtruck spécialisé dans les grillades et brochettes de viande, à savourer sur place ou à emporter.",
  address_default: "Biganos, Parc de l'Isle",
  latitude: 44.654000,
  longitude: -1.078000,
  status: true,
  user: created_pro
)
file = URI.open("https://source.unsplash.com/500x500/?grill,bbq")
foodtruck206.photo.attach(io: file, filename: "biganos_grill.jpg", content_type: "image/jpg")
foodtruck206.save

foodtruck207 = Foodtruck.create!(
  name: "Les Saveurs de Mios",
  phone_number: "07 69 63 28 207",
  category: "Cuisine du Monde",
  description: "Foodtruck qui propose une cuisine du monde, avec des recettes variées et épicées pour ravir tous les palais.",
  address_default: "Mios, Place du Marché",
  latitude: 44.591500 ,
  longitude: -1.084500,
  status: true,
  user: created_pro
)
file = URI.open("https://source.unsplash.com/500x500/?world,cuisine")
foodtruck207.photo.attach(io: file, filename: "saveurs_mios.jpg", content_type: "image/jpg")
foodtruck207.save

foodtruck208 = Foodtruck.create!(
  name: "La Casse Croûte",
  phone_number: "07 69 63 28 208",
  category: "Sandwichs",
  description: "Spécialisé dans les sandwichs gourmands, faits maison avec des ingrédients frais.",
  address_default: "Gujan-Mestras, Port de Gujan",
  latitude: 44.630000,
  longitude: -1.076000,
  status: true,
  user: created_pro
)
file = URI.open("https://source.unsplash.com/500x500/?sandwich,delicious")
foodtruck208.photo.attach(io: file, filename: "casse_croute.jpg", content_type: "image/jpg")
foodtruck208.save

foodtruck209 = Foodtruck.create!(
  name: "Le Tex-Mex",
  phone_number: "07 69 63 28 209",
  category: "Mexicain",
  description: "Foodtruck Tex-Mex proposant une fusion de saveurs américaines et mexicaines, avec des tacos, burritos et nachos.",
  address_default: "La Teste-de-Buch, Place des Ternes",
  latitude: 44.645000,
  longitude: -1.141500,
  status: true,
  user: created_pro
)

file = URI.open("https://source.unsplash.com/500x500/?mexican,tacos")
foodtruck209.photo.attach(io: file, filename: "tex_mex.jpg", content_type: "image/jpg")
foodtruck209.save

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

dish2 = Dish.new(
 foodtruck: foodtruck1,
 title: "Porce Lait",
 description: "Pain de mie toasté, porc IGP pané, chou blanc à la vinaigrette maison, sauce tonkatsu",
 price: 14.50
)
file = URI.open("https://kissmychef.com/wp-content/uploads/2022/05/Sando.jpg")
dish2.photo.attach(io: file, filename: "porce_lait.jpg", content_type: "image/jpg")
dish2.save

# Dishes pour Le Van Foodtruck
dish3 = Dish.new(
   foodtruck: foodtruck2,
   title: "Galette de Sarrasin",
   description: "à la fois tendre et délicatement parfumée, servie avec une garniture au choix : fromage, œuf, jambon ou légumes grillés.",
   price: 10.90
  )
  file = URI.open("https://www.cuisineactuelle.fr/imgre/fit/~1~cac~2023~01~17~999fccbd-d5ad-4cc2-91ba-d5a06206b882.jpeg/650x325/quality/80/crop-from/center/galette-de-sarrasin-a-l-ancienne.jpeg")
  dish3.photo.attach(io: file, filename: "galette_sarrasin.jpeg", content_type: "image/jpeg")
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

# Dishes pour Le Truck du chef
dish5 = Dish.new(
 foodtruck: foodtruck3,
 title: "Lomo Mariné",
 description: "Riz à létuvé, sauce barbecue maison",
 price: 13
)
file = URI.open("https://tfpj-s3.troisfoisparjour.com/app/uploads/2021/06/18100026/lomo_saltado-l-718x1024.jpg")
dish5.photo.attach(io: file, filename: "lomo_mariné.jpg", content_type: "image/jpg")
dish5.save

dish6 = Dish.new(
 foodtruck: foodtruck3,
 title: "Le burger du Truck",
 description: "Steak de boeuf,emmental,compotée d'oignons",
 price: 13
)
file = URI.open("https://local-fr-public.s3.eu-west-3.amazonaws.com/prod/webtool/userfiles/102971/solemio_a_oraison_7.png")
dish6.photo.attach(io: file, filename: "burger_truck.png", content_type: "image/png")
dish6.save

#Dishes pour le truck El Diablo
dish7 = Dish.new(
   foodtruck: foodtruck4,
   title: "Burritos",
   description: "Une grande tortilla de blé garnie de riz safrané, avec la
viande de votre choix (ou Veggie ! )",
   price: 11.50
  )
  file = URI.open("https://mccormick.widen.net/content/izbzaqadgd/original/cheeseburger_burritos_800x800.jpg")
  dish7.photo.attach(io: file, filename: "burritos.jpg", content_type: "image/jpg")
  dish7.save

dish8 = Dish.new(
   foodtruck: foodtruck4,
   title: "Quesadillas",
   description: "Pour les fans de fromage , une grande tortilla de blé
garni de fromage fondu, tomates, oignons poulet ou chorizo, légumes",
   price: 10.50
  )
  file = URI.open("https://cdn.loveandlemons.com/wp-content/uploads/2024/01/quesadilla.jpg")
  dish8.photo.attach(io: file, filename: "quesadillas.jpg", content_type: "image/jpg")
  dish8.save

  # Dishes pour le Yedi Tepe
dish9 = Dish.new(
   foodtruck: foodtruck5,
   title: "Beyti Kebab",
   description: "brochette de viande hachée grillée, servie dans une
galette avec une sauce tomate épicée, du yaourt et des légumes frais",
   price: 9.50
  )
  file = URI.open("https://mijn-smaak.nl/wp-content/uploads/2021/03/20201123_115126798_iOS.jpg")
  dish9.photo.attach(io: file, filename: "beyti_kebab.jpg", content_type: "image/jpg")
  dish9.save

dish10 = Dish.new(
   foodtruck: foodtruck5,
   title: "Panini turc",
   description: " Feta, tomate, purée d'olive ,chou rouge, cornichon",
   price: 8.50
  )
  file = URI.open("https://img.freepik.com/photos-premium/servir-sandwich-au-pain-grille-traditionnel-turc-nom-turc-ayvalik-tostu_753186-5026.jpg")
  dish10.photo.attach(io: file, filename: "panini_turc.jpg", content_type: "image/jpg")
  dish10.save

#Dishes Seasons foodtruck
dish11 = Dish.new(
   foodtruck: foodtruck6,
   title: "Hangover",
   description: "des pommes de terre rôties au four, du
bacon grillé, un oeuf au plat, une salade assaisonnée d'une sauce au citron",
   price: 8.50
  )
  file = URI.open("https://media.grenoble-tourisme.com/photos/structure_19212/8913213.jpg.1200x900_q90.jpg")
  dish11.photo.attach(io: file, filename: "hangover.jpg", content_type: "image/jpg")
  dish11.save

dish12 = Dish.new(
   foodtruck: foodtruck6,
   title: "English muffin",
   description: "Champignons sautés, épinards et fromage de
chèvre : Une option végétarienne savoureuse avec des légumes grillés et du fromage
crémeux",
   price: 10.50
  )
  file = URI.open("https://www.forkinthekitchen.com/wp-content/uploads/2019/09/230311.vegetarian.breakfast.sandwiches.updated-0694.jpg")
  dish12.photo.attach(io: file, filename: "english_muffin.jpg", content_type: "image/jpg")
  dish12.save

  # Plats pour Biganos Grill
dish2061 = Dish.create!(
  foodtruck: foodtruck206,
  title: "Brochettes de Viande",
  description: "Brochettes de poulet et de bœuf grillées à la perfection, servies avec une sauce barbecue maison.",
  price: 12.90
)

file = URI.open("https://source.unsplash.com/500x500/?skewers,grill")
dish2061.photo.attach(io: file, filename: "brochettes_viande.jpg", content_type: "image/jpg")
dish2061.save

dish2062 = Dish.create!(
  foodtruck: foodtruck206,
  title: "Burger du Grill",
  description: "Burger maison avec viande grillée, fromage fondu, salade et sauce maison.",
  price: 10.50
)

file = URI.open("https://source.unsplash.com/500x500/?burger,grilled")
dish2062.photo.attach(io: file, filename: "burger_grill.jpg", content_type: "image/jpg")
dish2062.save

# Plats pour Les Saveurs de Mios
dish2071 = Dish.create!(
  foodtruck: foodtruck207,
  title: "Tacos épicés",
  description: "Tacos garnis de viande épicée, légumes frais et sauce pimentée.",
  price: 9.90
)

file = URI.open("https://source.unsplash.com/500x500/?tacos,spicy")
dish2071.photo.attach(io: file, filename: "tacos_epices.jpg", content_type: "image/jpg")
dish2071.save

dish2072 = Dish.create!(
  foodtruck: foodtruck207,
  title: "Curry Thaï",
  description: "Curry thaï épicé avec du poulet, des légumes croquants et du riz parfumé.",
  price: 14.90
)

file = URI.open("https://source.unsplash.com/500x500/?thai,curry")
dish2072.photo.attach(io: file, filename: "curry_thai.jpg", content_type: "image/jpg")
dish2072.save

# Plats pour La Casse Croûte
dish2081 = Dish.create!(
  foodtruck: foodtruck208,
  title: "Sandwich au Poulet",
  description: "Sandwich garni de poulet grillé, salade, tomates et sauce au yaourt.",
  price: 8.90
)

file = URI.open("https://source.unsplash.com/500x500/?chicken,sandwich")
dish2081.photo.attach(io: file, filename: "sandwich_poulet.jpg", content_type: "image/jpg")
dish2081.save

dish2082 = Dish.create!(
  foodtruck: foodtruck208,
  title: "Panini Savoyard",
  description: "Panini chaud au jambon de pays, fromage de Savoie et sauce béchamel.",
  price: 7.50
)

file = URI.open("https://source.unsplash.com/500x500/?panini,sandwich")
dish2082.photo.attach(io: file, filename: "panini_savoyard.jpg", content_type: "image/jpg")
dish2082.save

# Plats pour Le Tex-Mex
dish2091 = Dish.create!(
  foodtruck: foodtruck209,
  title: "Burrito au Poulet",
  description: "Burrito rempli de poulet mariné, avocat, riz, haricots et sauce salsa.",
  price: 12.00
)

file = URI.open("https://source.unsplash.com/500x500/?burrito,chicken")
dish2091.photo.attach(io: file, filename: "burrito_poulet.jpg", content_type: "image/jpg")
dish2091.save

dish2092 = Dish.create!(
  foodtruck: foodtruck209,
  title: "Tacos au Bœuf",
  description: "Tacos garnis de viande de bœuf épicée, laitue, tomate et fromage fondu.",
  price: 10.50
)

file = URI.open("https://source.unsplash.com/500x500/?tacos,beef")
dish2092.photo.attach(io: file, filename: "tacos_boeuf.jpg", content_type: "image/jpg")
dish2092.save
