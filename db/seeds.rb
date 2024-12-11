# On configure Geocoder pour ne rien faire pendant le seed
Geocoder.configure(lookup: :null)

Dish.destroy_all
Favorite.destroy_all
Foodtruck.destroy_all
User.destroy_all


users = [
  {
    first_name: "Martin",
    last_name: "Thomas",
    email: "martin.client@gmail.com",
    password: "password123",
    address_default: "15 rue des terres neuves",
    latitude: 44.841225,
    longitude: -0.580036,
    role: "false"
  },
  {
    first_name: "Dupont",
    last_name: "Marc",
    email: "marcdupont.pro@gmail.com",
    password: "password123",
    address_default: "15 rue des terres neuves",
    latitude: 44.841225,
    longitude: -0.580036,
    role: "true"
  }
]

created_client = User.create!(users.first)
created_pro = User.create!(users.last)

foodtrucks = [
  {
    name: "Sando Truck",
    phone_number: "07 66 28 54 36",
    category: "asiatique",
    description: "Une culture japonaise avant tout...Les sando, mais c'est quoi ? Inspiré de la culture japonaise, ce sandwich japonais XXL aux tranches de pain de mie et à la garniture généreuse est une recette de street-food emblématique de Japon",
    address_default: "Gare de Bordeaux",
    latitude: 44.823462,
    longitude: -0.556544,
    status: true,
    user: created_pro
  },
  {
    name: "Le Van Foodtruck",
    phone_number: "07 69 63 28 30",
    category: "crêperie",
    description: "Fondatrice du food-truck, Lolita souhaite moderniser la façon de servir les galettes et les crêpes mais aussi la façon de les cuisiner, en proposant des produits dérivés comme des samoussas à la galette de sarrasin ou des chips de sarrasin.",
    address_default: "Esplanade . Arrêt Tram Montaigne Montesquieu - Pessac",
    latitude: 44.81011,
    longitude: -0.64129,
    status: true,
    user: created_pro
  },
  {
    name: "Truck de chef",
    phone_number: "06 61 77 68 08",
    category: "fr",
    description: "Une cuisine bistro de qualité, tout en fraîcheur, avec des recettes pratiques à manger, conçues pour être dégustées de façon nomade.",
    address_default: "Square Léonie Bonnet – Floirac",
    latitude: 44.83238,
    longitude: -0.514021,
    status: true,
    user: created_pro
  },
  {
    name: "El taco del diablo",
    phone_number: "09 80 80 04 92",
    category: "mexicain/californien",
    description: "La street food et les food trucks étaient notre quotidien à Los Angeles, nous avons voulu à notre retour en France, à Bordeaux, partager notre expérience, et surtout faire connaître aux bordelais les célèbres tacos californiens",
    address_default: "87 Rue Lagrange 33000 BORDEAUX",
    latitude: 44.8524179,
    longitude: -0.581036,
    status: true,
    user: created_pro
  },
  {
    name: "Yedi Tepe",
    phone_number: "08 90 21 01 68",
    category: "cuisine turque",
    description: "Embarquez pour un voyage de saveurs avec Yepi Tepe, votre food truck spécialisé dans la cuisine turque authentique !",
    address_default: "6 Rue des Comètes - 33185 Le Haillan",
    latitude: 44.8593025,
    longitude: -0.669148,
    status: false,
    user: created_pro
  },
  {
    name: "Seasons food truck",
    phone_number: "06 31 86 58 03",
    category: "cuisine de saison",
    description: "Les maîtres mots : le respect des saisons, la sélection des bons produits via les producteurs locaux et l'inspiration brunch de la carte",
    address_default: "place Paul Doumer (Chartrons)",
    latitude: 44.8521802,
    longitude: -0.5737263,
    status: false,
    user: created_pro
  }
]

created_foodtrucks = foodtrucks.map { |ft_data|
  Foodtruck.new(ft_data).tap { |ft| ft.save(validate: false) }
}

dishes = [
  {
    foodtruck: created_foodtrucks[0],
    title: "Veggie Sando",
    description: "Pain de mie toasté, aubergine panée, chou blanc à la vinaigrette maison, sauce tonkatsu",
    price: 12.50
  },
  {
    foodtruck: created_foodtrucks[0],
    title: "Porce Lait",
    description: "Pain de mie toasté, porc IGP pané, chou blanc à la vinaigrette maison, sauce tonkatsu",
    price: 14.50
  },
  {
    foodtruck: created_foodtrucks[1],
    title: "Galette de Sarrasin",
    description: "à la fois tendre et délicatement parfumée, servie avec une garniture au choix : fromage, œuf, jambon ou légumes grillés.",
    price: 10.90
  },
  {
    foodtruck: created_foodtrucks[1],
    title: "Crêpe sucrée",
    description: "Une crêpe sucrée délicatement sucrée, que vous pourrez savourer nature ou accompagnée de garnitures gourmandes comme chocolat, caramel, fruits frais ou crème chantilly.",
    price: 6.50
  }
]

dishes.each { |dish_data| Dish.create!(dish_data) }
