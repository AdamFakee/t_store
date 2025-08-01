import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/routers/routers.dart';

class TDummyData {
  // List of all Categories
  final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image:
          "https://plus.unsplash.com/premium_vector-1711878181241-84b3682ce6cf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c3BvcnR8ZW58MHx8MHx8fDA%3D",
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image:
          "https://plus.unsplash.com/premium_vector-1724552052083-31a9234a7ac2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZnVybml0dXJlfGVufDB8fDB8fHww",
      name: 'Furniture',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image:
          "https://plus.unsplash.com/premium_vector-1723606448934-4386529f2736?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8RWxlY3Ryb25pY3N8ZW58MHx8MHx8fDA%3D",
      name: 'Electronics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image:
          "https://plus.unsplash.com/premium_vector-1720619934461-d1e3df403aac?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2xvdGhzfGVufDB8fDB8fHww",
      name: 'Cloths',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image:
          "https://images.unsplash.com/vector-1738241822563-5cb6e37e089a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image:
          "https://plus.unsplash.com/premium_vector-1711647138436-e49d60c10b15?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8U2hvZXN8ZW58MHx8MHx8fDA%3D",
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image:
          "https://plus.unsplash.com/premium_vector-1722165681200-1b73a91763d7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q29zbWV0aWNzfGVufDB8fDB8fHww",
      name: 'Cosmetics',
      isFeatured: true,
    ),

    // Subcategories
    CategoryModel(
      id: '8',
      image:
          "https://images.unsplash.com/vector-1738590592306-6580737c57dc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8U3BvcnQlMjBTaG9lc3xlbnwwfHwwfHx8MA%3D%3D",
      name: 'Sport Shoes',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '9',
      image:
          "https://plus.unsplash.com/premium_vector-1725617580757-4031ac3c9c63?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8U3BvcnQlMjBTdWl0c3xlbnwwfHwwfHx8MA%3D%3D",
      name: 'Sport suits',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      image:
          "https://plus.unsplash.com/premium_vector-1719267110672-a85f04661d14?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8U3BvcnQlMjBTdWl0c3xlbnwwfHwwfHx8MA%3D%3D",
      name: 'Sports Equipments',
      parentId: '1',
      isFeatured: false,
    ),

    // Furniture
    CategoryModel(
      id: '11',
      image:
          "https://plus.unsplash.com/premium_vector-1734453014300-b3cc427b1ff5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8QmVkcm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      name: 'Bedroom furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      image:
          "https://plus.unsplash.com/premium_vector-1724512673852-3d7f22315b2b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2l0Y2hlbiUyMGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      name: 'Kitchen furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      image:
          "https://plus.unsplash.com/premium_vector-1725346177236-dbd64c999087?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8b2ZmaWNlJTIwZnVybml0dXJlfGVufDB8fDB8fHww",
      name: 'Office furniture',
      parentId: '5',
      isFeatured: false,
    ),

    // Electronics
    CategoryModel(
      id: '14',
      image:
          "https://plus.unsplash.com/premium_vector-1721983446755-6336c22d4618?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8TGFwdG9wfGVufDB8fDB8fHww",
      name: 'Laptop',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      image:
          "https://images.unsplash.com/vector-1753855747975-bdfa1151b37b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9iaWxlfGVufDB8fDB8fHww",
      name: 'Mobile',
      parentId: '2',
      isFeatured: false,
    ),

    // Cloths
    CategoryModel(
      id: '16',
      image:
          "https://plus.unsplash.com/premium_vector-1720523167050-42ff1ae20451?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U2hpcnRzfGVufDB8fDB8fHww",
      name: 'Shirts',
      parentId: '3',
      isFeatured: false,
    ),
  ];

  final List<BannerModel> banners = [
    BannerModel(
      image:
          "https://as1.ftcdn.net/jpg/03/14/28/96/1000_F_314289607_ADADbnGr64dpGnddyhZPidCoc6jgKiHK.jpg",
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      image:
          "https://plus.unsplash.com/premium_vector-1726536368911-1b1ee010a5cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWNvbWVyY2V8ZW58MHx8MHx8fDA%3D",
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      image:
          "https://plus.unsplash.com/premium_photo-1683580362892-fc31c2ff935b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZmF2b3JpdGV8ZW58MHx8MHx8fDA%3D",
      targetScreen: TRoutes.favourites,
      active: true,
    ),
    BannerModel(
      image:
          "https://plus.unsplash.com/premium_photo-1677408938823-dddebdf2fbff?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c2VhcmNofGVufDB8fDB8fHww",
      targetScreen: TRoutes.search,
      active: false,
    ),
    BannerModel(
      image:
          "https://plus.unsplash.com/premium_vector-1731582098706-cb92f9272335?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2V0dGluZ3xlbnwwfHwwfHx8MA%3D%3D",
      targetScreen: TRoutes.settings,
      active: true,
    ),
    BannerModel(
      image:
          "https://plus.unsplash.com/premium_vector-1727788453836-d2681d41ca2e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1haWxib3h8ZW58MHx8MHx8fDA%3D",
      targetScreen: TRoutes.userAddress,
      active: true,
    ),
  ];
}
