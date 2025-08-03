import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_attributes_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';
import 'package:t_store/utils/constants/enums.dart';
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

  final List<ProductModel> demoProducts = [
    // 1. Áo thun nam
    ProductModel(
      id: '001',
      title: 'Áo thun nam cổ tròn',
      stock: 100,
      price: 199000,
      salePrice: 149000,
      thumbnail:
          'https://images.unsplash.com/photo-1700585560129-2c03e2a3f511?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHRzaGlydF90aHVtYnxlbnwwfHwwfHx8MA%3D%3D',
      productType: ProductType.variation.name,
      description: 'Áo thun nam chất liệu cotton thoáng mát',
      isFeatured: true,
      images: [
        'https://images.unsplash.com/photo-1700585560129-2c03e2a3f511?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHRzaGlydF90aHVtYnxlbnwwfHwwfHx8MA%3D%3D',
        'https://images.unsplash.com/photo-1564864310852-e1e98eb07010?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dHNoaXJ0X3RodW1ifGVufDB8fDB8fHww',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '001_red_s',
          sku: 'TS001-RED-S',
          price: 199000,
          salePrice: 149000,
          stock: 25,
          image:
              'https://images.unsplash.com/photo-1553981474-b94767418c25?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHRzaGlydF90aHVtYnxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Red', 'Size': 'S'},
        ),
        ProductVariationModel(
          id: '001_blue_m',
          sku: 'TS001-BLUE-M',
          price: 199000,
          salePrice: 149000,
          stock: 30,
          image:
              'https://images.unsplash.com/photo-1635796273083-93e4091d9712?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGhvb2R5fGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
      ],
      brand: BrandModel(
        id: 'brand1',
        name: 'Nike',
        image:
            'https://images.unsplash.com/photo-1608541737042-87a12275d313?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bmlrZXxlbnwwfHwwfHx8MA%3D%3D',
      ),
    ),

    // 2. Quần jeans nam
    ProductModel(
      id: '002',
      title: 'Quần jeans nam',
      stock: 80,
      price: 490,
      salePrice: 399,
      thumbnail:
          'https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8amVhbnN8ZW58MHx8MHx8fDA%3D',
      productType: ProductType.variation.name,
      description: 'Quần jeans nam dáng slimfit co giãn',
      images: [
        'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8amVhbnN8ZW58MHx8MHx8fDA%3D',
        'https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8amVhbnN8ZW58MHx8MHx8fDA%3Dg',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue', 'Black']),
        ProductAttributeModel(name: 'Size', values: ['28', '30', '32', '34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '002_blue_30',
          sku: 'JN002-BLUE-30',
          price: 499,
          salePrice: 399,
          stock: 20,
          image:
              'https://images.unsplash.com/photo-1475178626620-a4d074967452?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8amVhbnN8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Blue', 'Size': '30'},
        ),
        ProductVariationModel(
          id: '002_black_32',
          sku: 'JN002-BLACK-32',
          price: 499,
          salePrice: 399,
          stock: 15,
          image:
              'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGplYW5zfGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Black', 'Size': '32'},
        ),
      ],
      brand: BrandModel(
        id: 'brand2',
        name: 'DenimPro',
        image: 'https://example.com/brands/denimpro.jpg',
      ),
    ),

    // 3. Giày thể thao
    ProductModel(
      id: '003',
      title: 'Giày thể thao',
      stock: 50,
      price: 899,
      salePrice: 699,
      thumbnail:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D',
      productType: ProductType.variation.name,
      description: 'Giày thể thao đế êm chống sốc',
      isFeatured: true,
      images: [
        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D',
        'https://plus.unsplash.com/premium_photo-1682435561654-20d84cef00eb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Black']),
        ProductAttributeModel(
          name: 'Size',
          values: ['38', '39', '40', '41', '42'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '003_white_40',
          sku: 'SN003-WHITE-40',
          price: 899,
          salePrice: 699,
          stock: 10,
          image:
              'https://images.unsplash.com/photo-1512374382149-233c42b6a83b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'White', 'Size': '40'},
        ),
        ProductVariationModel(
          id: '003_black_42',
          sku: 'SN003-BLACK-42',
          price: 890,
          salePrice: 699,
          stock: 8,
          image:
              'https://images.unsplash.com/photo-1579446650032-86effeeb3389?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHNuZWFrZXJzfGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Black', 'Size': '42'},
        ),
      ],
      brand: BrandModel(
        id: 'brand3',
        name: 'SportFlex',
        image: 'https://example.com/brands/sportflex.jpg',
      ),
    ),

    // 4. Túi xách nữ
    ProductModel(
      id: '004',
      title: 'Túi xách da nữ',
      stock: 45,
      price: 650,
      salePrice: 50,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1723826753083-2309f7203ab1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
      productType: ProductType.variation.name,
      description: 'Túi xách da cao cấp nhiều ngăn',
      images: [
        'https://plus.unsplash.com/premium_photo-1723826753083-2309f7203ab1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
        'https://plus.unsplash.com/premium_photo-1673384389924-097135cbf1cd?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Pink', 'Red']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '004_black',
          sku: 'HB004-BLACK',
          price: 650,
          salePrice: 55,
          stock: 20,
          image:
              'https://images.unsplash.com/photo-1705909237050-7a7625b47fac?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Black'},
        ),
        ProductVariationModel(
          id: '004_pink',
          sku: 'HB004-PINK',
          price: 650,
          salePrice: 55,
          stock: 15,
          image:
              'https://images.unsplash.com/photo-1683921590274-a83862cb11c3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Pink'},
        ),
        ProductVariationModel(
          id: '004_red',
          sku: 'HB004-RED',
          price: 600,
          salePrice: 50,
          stock: 20,
          image:
              'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3DD',
          attributeValues: {'Color': 'Red'},
        ),
      ],
      brand: BrandModel(
        id: 'brand4',
        name: 'LuxuryBag',
        image: 'https://example.com/brands/luxurybag.jpg',
      ),
    ),

    // 5. Đồng hồ thông minh
    ProductModel(
      id: '005',
      title: 'Đồng hồ thông minh',
      stock: 35,
      price: 12,
      salePrice: 9,
      thumbnail:
          'https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2F0Y2h8ZW58MHx8MHx8fDA%3D',
      productType: ProductType.variation.name,
      description: 'Đồng hồ thông minh theo dõi sức khỏe',
      isFeatured: true,
      images: [
        'https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2F0Y2h8ZW58MHx8MHx8fDA%3D',
        'https://plus.unsplash.com/premium_photo-1670537439541-d2eb20e1f6ce?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8d2F0Y2h8ZW58MHx8MHx8fDA%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '005_black',
          sku: 'SW005-BLACK',
          price: 12,
          salePrice: 9,
          stock: 15,
          image:
              'https://images.unsplash.com/photo-1547996160-81dfa63595aa?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHdhdGNofGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Black'},
        ),
        ProductVariationModel(
          id: '005_blue',
          sku: 'SW005-BLUE',
          price: 12,
          salePrice: 9,
          stock: 10,
          image:
              'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8d2F0Y2h8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Blue'},
        ),
      ],
      brand: BrandModel(
        id: 'brand5',
        name: 'TechWear',
        image: 'https://example.com/brands/techwear.jpg',
      ),
    ),

    // 6. Tai nghe không dây
    ProductModel(
      id: '006',
      title: 'Tai nghe Bluetooth',
      stock: 60,
      price: 85,
      salePrice: 60,
      thumbnail:
          'https://images.unsplash.com/photo-1627989580309-bfaf3e58af6f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZWFyYnVkfGVufDB8fDB8fHww',
      productType: ProductType.variation.name,
      description: 'Tai nghe không dây chống ồn',
      images: [
        'https://images.unsplash.com/photo-1627989580309-bfaf3e58af6f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZWFyYnVkfGVufDB8fDB8fHww',
        'https://images.unsplash.com/photo-1606763106198-4ffc663c2419?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZWFyYnVkfGVufDB8fDB8fHww',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Black', 'Red']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '006_white',
          sku: 'EB006-WHITE',
          price: 85,
          salePrice: 60,
          stock: 25,
          image:
              'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGVhcmJ1ZHxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'White'},
        ),
        ProductVariationModel(
          id: '006_black',
          sku: 'EB006-BLACK',
          price: 80,
          salePrice: 60,
          stock: 20,
          image:
              'https://images.unsplash.com/photo-1634874256168-a64b3aadbf81?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGVhcmJ1ZHxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Black'},
        ),
      ],
      brand: BrandModel(
        id: 'brand6',
        name: 'SoundPlus',
        image: 'https://example.com/brands/soundplus.jpg',
      ),
    ),

    // 7. Áo khoác nam
    ProductModel(
      id: '007',
      title: 'Áo khoác dù nam',
      stock: 40,
      price: 45,
      salePrice: 39,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1674719144570-0728faf14f96?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8amFja2V0fGVufDB8fDB8fHww',
      productType: ProductType.variation.name,
      description: 'Áo khoác chống nước nhẹ',
      isFeatured: true,
      images: [
        'https://plus.unsplash.com/premium_photo-1674719144570-0728faf14f96?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8amFja2V0fGVufDB8fDB8fHww',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '007_black_m',
          sku: 'JK007-BLACK-M',
          price: 40,
          salePrice: 30,
          stock: 12,
          image:
              'https://images.unsplash.com/photo-1521223890158-f9f7c3d5d504?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8amFja2V0fGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Black', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '007_blue_l',
          sku: 'JK007-BLUE-L',
          price: 45,
          salePrice: 39,
          stock: 10,
          image:
              'https://images.unsplash.com/photo-1611312449408-fcece27cdbb7?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8amFja2V0fGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      brand: BrandModel(
        id: 'brand7',
        name: 'OutdoorGear',
        image: 'https://example.com/brands/outdoorgear.jpg',
      ),
    ),

    // 8. Bàn phím cơ
    ProductModel(
      id: '008',
      title: 'Bàn phím cơ gaming',
      stock: 25,
      price: 120,
      salePrice: 90,
      thumbnail:
          'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2V5Ym9hcmR8ZW58MHx8MHx8fDA%3Dg',
      productType: ProductType.variation.name,
      description: 'Bàn phím cơ switch đỏ',
      images: [
        'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2V5Ym9hcmR8ZW58MHx8MHx8fDA%3D',
        'https://images.unsplash.com/photo-1536059540012-f2ed455bc0b1?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8a2V5Ym9hcmR8ZW58MHx8MHx8fDA%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'White']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '008_black',
          sku: 'KB008-BLACK',
          price: 100,
          salePrice: 90,
          stock: 10,
          image:
              'https://images.unsplash.com/photo-1618384887929-16ec33fab9ef?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8a2V5Ym9hcmR8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Black'},
        ),
        ProductVariationModel(
          id: '008_rgb',
          sku: 'KB008-RGB',
          price: 120,
          salePrice: 90,
          stock: 8,
          image:
              'https://images.unsplash.com/photo-1560762484-813fc97650a0?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGtleWJvYXJkfGVufDB8fDB8fHww',
          attributeValues: {'Color': 'RGB'},
        ),
      ],
      brand: BrandModel(
        id: 'brand8',
        name: 'GamingPro',
        image: 'https://example.com/brands/gamingpro.jpg',
      ),
    ),

    // 9. Nồi chiên không dầu
    ProductModel(
      id: '009',
      title: 'Nồi chiên không dầu',
      stock: 30,
      price: 150,
      salePrice: 10,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1672192166833-c8ae84e5e127?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YWlyZnJ5ZXJ8ZW58MHx8MHx8fDA%3D',
      productType: ProductType.single.name,
      description: 'Nồi chiên không dầu 5.5L',
      isFeatured: true,
      images: [
        'https://plus.unsplash.com/premium_photo-1672192166833-c8ae84e5e127?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YWlyZnJ5ZXJ8ZW58MHx8MHx8fDA%3D',
        'https://plus.unsplash.com/premium_photo-1711477326406-2b53375330f7?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YWlyZnJ5ZXJ8ZW58MHx8MHx8fDA%3D',
      ],
      brand: BrandModel(
        id: 'brand9',
        name: 'HomeTech',
        image: 'https://example.com/brands/hometech.jpg',
      ),
    ),

    // 10. Son lì
    ProductModel(
      id: '010',
      title: 'Son lì cao cấp',
      stock: 50,
      price: 25,
      salePrice: 19,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1677526496932-1b4bddeee554?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGlwc3RpY2t8ZW58MHx8MHx8fDA%3Dg',
      productType: ProductType.variation.name,
      description: 'Son lì lâu trôi 12 giờ',
      images: [
        'https://plus.unsplash.com/premium_photo-1677526496932-1b4bddeee554?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGlwc3RpY2t8ZW58MHx8MHx8fDA%3D',
        'https://images.unsplash.com/photo-1613255348289-1407e4f2f980?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bGlwc3RpY2t8ZW58MHx8MHx8fDA%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Pink']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '010_red',
          sku: 'LP010-RED',
          price: 20,
          salePrice: 10,
          stock: 20,
          image:
              'https://images.unsplash.com/photo-1626895872564-b691b6877b83?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bGlwc3RpY2t8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Red'},
        ),
        ProductVariationModel(
          id: '010_pink',
          sku: 'LP010-PINK',
          price: 20,
          salePrice: 10,
          stock: 15,
          image:
              'https://images.unsplash.com/photo-1571646034647-52e6ea84b28c?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGxpcHN0aWNrfGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Pink'},
        ),
      ],
      brand: BrandModel(
        id: 'brand10',
        name: 'BeautyQueen',
        image: 'https://example.com/brands/beautyqueen.jpg',
      ),
    ),
    // 11. Laptop Gaming
    ProductModel(
      id: '011',
      title: 'Laptop Gaming RTX 3060',
      stock: 15,
      price: 250,
      salePrice: 200,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1681702156223-ea59bfbf1065?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bGFwdG9wfGVufDB8fDB8fHww',
      productType: ProductType.variation.name,
      description: 'Laptop gaming cấu hình mạnh, card RTX 3060',
      isFeatured: true,
      images: [
        'https://plus.unsplash.com/premium_photo-1681702156223-ea59bfbf1065?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bGFwdG9wfGVufDB8fDB8fHww',
        'https://plus.unsplash.com/premium_photo-1681702156223-ea59bfbf1065?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bGFwdG9wfGVufDB8fDB8fHww',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Grey']),
        ProductAttributeModel(name: 'RAM', values: ['16GB', '32GB']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '011_black_16gb',
          sku: 'LT011-BLACK-16',
          price: 200,
          salePrice: 200,
          stock: 8,
          image:
              'https://images.unsplash.com/photo-1531297484001-80022131f5a1?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGxhcHRvcHxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Black', 'RAM': '16GB'},
        ),
        ProductVariationModel(
          id: '011_grey_32gb',
          sku: 'LT011-GREY-32',
          price: 280,
          salePrice: 200,
          stock: 5,
          image:
              'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcHxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Grey', 'RAM': '32GB'},
        ),
      ],
      brand: BrandModel(
        id: 'brand11',
        name: 'GameMaster',
        image: 'https://example.com/brands/gamemaster.jpg',
      ),
    ),

    // 12. Điện thoại smartphone
    ProductModel(
      id: '012',
      title: 'Smartphone Flagship 2023',
      stock: 30,
      price: 180,
      salePrice: 169,
      thumbnail:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGhvbmV8ZW58MHx8MHx8fDA%3D',
      productType: ProductType.variation.name,
      description: 'Điện thoại flagship camera 108MP',
      images: [
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGhvbmV8ZW58MHx8MHx8fDA%3D',
        'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHBob25lfGVufDB8fDB8fHww',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Blue']),
        ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '012_black_128',
          sku: 'PH012-BLACK-128',
          price: 18,
          salePrice: 10,
          stock: 12,
          image:
              'https://unsplash.com/photos/silver-iphone-x-floating-over-open-palm-6wdRuK7bVTE',
          attributeValues: {'Color': 'Black', 'Storage': '128GB'},
        ),
        ProductVariationModel(
          id: '012_blue_256',
          sku: 'PH012-BLUE-256',
          price: 20,
          salePrice: 10,
          stock: 8,
          image:
              'https://images.unsplash.com/photo-1507955987999-df4864ee80d4?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHBob25lfGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Blue', 'Storage': '256GB'},
        ),
      ],
      brand: BrandModel(
        id: 'brand12',
        name: 'MobileX',
        image: 'https://example.com/brands/mobilex.jpg',
      ),
    ),

    // 13. Balo du lịch
    ProductModel(
      id: '013',
      title: 'Balo du lịch chống nước',
      stock: 40,
      price: 45,
      salePrice: 30,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1723649902616-0dce94980e06?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFncGFja3xlbnwwfHwwfHx8MA%3D%3D',
      productType: ProductType.variation.name,
      description: 'Balo du lịch đa năng 30L chống nước',
      images: [
        'https://plus.unsplash.com/premium_photo-1723649902616-0dce94980e06?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFncGFja3xlbnwwfHwwfHx8MA%3D%3D',
        'https://images.unsplash.com/photo-1550253594-356b2f788907?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmFncGFja3xlbnwwfHwwfHx8MA%3D%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '013_black',
          sku: 'BP013-BLACK',
          price: 40,
          salePrice: 30,
          stock: 15,
          image:
              'https://images.unsplash.com/photo-1621609764049-5ee1db3d7c35?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmFncGFja3xlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Black'},
        ),
        ProductVariationModel(
          id: '013_blue',
          sku: 'BP013-BLUE',
          price: 40,
          salePrice: 39,
          stock: 12,
          image:
              'https://plus.unsplash.com/premium_photo-1722993519879-aadaa597ba3f?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YmFncGFja3xlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Blue'},
        ),
      ],
      brand: BrandModel(
        id: 'brand13',
        name: 'TravelGear',
        image: 'https://example.com/brands/travelgear.jpg',
      ),
    ),

    // 14. Gối ôm hình thú
    ProductModel(
      id: '014',
      title: 'Gối ôm hình thú',
      stock: 60,
      price: 10,
      salePrice: 2,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1664300639940-9ee2bbc1bd1d?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGlsbG93fGVufDB8fDB8fHww',
      productType: ProductType.variation.name,
      description: 'Gối ôm hình thú dễ thương',
      isFeatured: true,
      images: [
        'https://plus.unsplash.com/premium_photo-1664300639940-9ee2bbc1bd1d?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGlsbG93fGVufDB8fDB8fHww',
        'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGlsbG93fGVufDB8fDB8fHww',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Pink', 'Blue']),
        ProductAttributeModel(name: 'Animal', values: ['Bear', 'Rabbit']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '014_pink_bear',
          sku: 'PL014-PINK-BEAR',
          price: 15,
          salePrice: 12,
          stock: 20,
          image:
              'https://plus.unsplash.com/premium_photo-1723867416688-cef0260874ae?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjl8fHBpbGxvd3xlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Pink', 'Animal': 'Bear'},
        ),
        ProductVariationModel(
          id: '014_blue_cat',
          sku: 'PL014-BLUE-CAT',
          price: 10,
          salePrice: 1,
          stock: 15,
          image:
              'https://plus.unsplash.com/premium_photo-1675922385078-782e5a4fa314?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBpbGxvd3xlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Blue', 'Animal': 'Cat'},
        ),
      ],
      brand: BrandModel(
        id: 'brand14',
        name: 'HomeComfort',
        image: 'https://example.com/brands/homecomfort.jpg',
      ),
    ),

    // 15. Máy xay sinh tố
    ProductModel(
      id: '015',
      title: 'Máy xay sinh tố đa năng',
      stock: 25,
      price: 80,
      salePrice: 70,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1663853294058-3f85f18a4bed?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmxlbmRlcnxlbnwwfHwwfHx8MA%3D%3D',
      productType: ProductType.single.name,
      description: 'Máy xay sinh tố công suất cao 1000W',
      images: [
        'https://plus.unsplash.com/premium_photo-1663853294058-3f85f18a4bed?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmxlbmRlcnxlbnwwfHwwfHx8MA%3D%3D',
        'https://images.unsplash.com/photo-1585515320310-259814833e62?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmxlbmRlcnxlbnwwfHwwfHx8MA%3D%3D',
      ],
      brand: BrandModel(
        id: 'brand15',
        name: 'KitchenPro',
        image: 'https://example.com/brands/kitchenpro.jpg',
      ),
    ),

    // 16. Bình giữ nhiệt
    ProductModel(
      id: '016',
      title: 'Bình giữ nhiệt 500ml',
      stock: 50,
      price: 20,
      salePrice: 10,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1681154819809-b660a509e1ee?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dGhlcm1vc3xlbnwwfHwwfHx8MA%3D%3D',
      productType: ProductType.variation.name,
      description: 'Bình giữ nhiệt 12 tiếng, chất liệu inox',
      images: [
        'https://plus.unsplash.com/premium_photo-1681154819809-b660a509e1ee?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dGhlcm1vc3xlbnwwfHwwfHx8MA%3D%3D',
        'https://images.unsplash.com/photo-1541346592492-55018cecdfe0?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGhlcm1vc3xlbnwwfHwwfHx8MA%3D%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Pink']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '016_black',
          sku: 'TH016-BLACK',
          price: 20,
          salePrice: 19,
          stock: 20,
          image:
              'https://images.unsplash.com/photo-1571162141779-2253174d5dc2?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dGhlcm1vc3xlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Black'},
        ),
        ProductVariationModel(
          id: '016_pink',
          sku: 'TH016-PINK',
          price: 25,
          salePrice: 10,
          stock: 15,
          image:
              'https://images.unsplash.com/photo-1564287690617-34aff8f85015?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHRoZXJtb3N8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Pink'},
        ),
      ],
      brand: BrandModel(
        id: 'brand16',
        name: 'ThermoKing',
        image: 'https://example.com/brands/thermoking.jpg',
      ),
    ),

    // 17. Kính mát thời trang
    ProductModel(
      id: '017',
      title: 'Kính mát chống UV',
      stock: 35,
      price: 30,
      salePrice: 20,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1682470102756-4592362e8516?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3VuZ2xhc3N8ZW58MHx8MHx8fDA%3D',
      productType: ProductType.variation.name,
      description: 'Kính mát thời trang chống UV 100%',
      isFeatured: true,
      images: [
        'https://plus.unsplash.com/premium_photo-1682470102756-4592362e8516?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3VuZ2xhc3N8ZW58MHx8MHx8fDA%3D',
        'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3VuZ2xhc3N8ZW58MHx8MHx8fDA%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Blue', 'Gold']),
        ProductAttributeModel(name: 'Shape', values: ['Aviator', 'Wayfarer']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '017_black_aviator',
          sku: 'SG017-BLACK-AV',
          price: 30,
          salePrice: 20,
          stock: 12,
          image:
              'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c3VuZ2xhc3N8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Black', 'Shape': 'Aviator'},
        ),
        ProductVariationModel(
          id: '017_gold_wayfarer',
          sku: 'SG017-GOLD-WF',
          price: 30,
          salePrice: 29,
          stock: 10,
          image:
              'https://images.unsplash.com/photo-1508296695146-257a814070b4?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3VuZ2xhc3N8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Gold', 'Shape': 'Wayfarer'},
        ),
      ],
      brand: BrandModel(
        id: 'brand17',
        name: 'SunShades',
        image: 'https://example.com/brands/sunshades.jpg',
      ),
    ),

    // 18. Vòng tay thời trang
    ProductModel(
      id: '018',
      title: 'Vòng tay phong cách',
      stock: 45,
      price: 12,
      salePrice: 9,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1681276168324-a6f1958aa191?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YnJhY2VsZXR8ZW58MHx8MHx8fDA%3D',
      productType: ProductType.variation.name,
      description: 'Vòng tay thời trang chất liệu thép không gỉ',
      images: [
        'https://plus.unsplash.com/premium_photo-1681276168324-a6f1958aa191?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YnJhY2VsZXR8ZW58MHx8MHx8fDA%3D',
        'https://images.unsplash.com/photo-1633810543462-77c4a3b13f07?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnJhY2VsZXR8ZW58MHx8MHx8fDA%3D',
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Silver', 'Gold', 'Black'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '018_silver',
          sku: 'BR018-SILVER',
          price: 12,
          salePrice: 8,
          stock: 18,
          image:
              'https://images.unsplash.com/photo-1619119069152-a2b331eb392a?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnJhY2VsZXR8ZW58MHx8MHx8fDA%3D',
          attributeValues: {'Color': 'Silver'},
        ),
        ProductVariationModel(
          id: '018_gold',
          sku: 'BR018-GOLD',
          price: 12,
          salePrice: 9,
          stock: 15,
          image:
              'https://images.unsplash.com/photo-1721206624492-3d05631471ea?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJyYWNlbGV0fGVufDB8fDB8fHww',
          attributeValues: {'Color': 'Gold'},
        ),
      ],
      brand: BrandModel(
        id: 'brand18',
        name: 'FashionJewel',
        image: 'https://example.com/brands/fashionjewel.jpg',
      ),
    ),

    // 19. Nước hoa nam
    ProductModel(
      id: '019',
      title: 'Nước hoa nam cao cấp',
      stock: 20,
      price: 12,
      salePrice: 10,
      thumbnail:
          'https://plus.unsplash.com/premium_photo-1679106770086-f4355693be1b?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyZnVtZXxlbnwwfHwwfHx8MA%3D%3D',
      productType: ProductType.variation.name,
      description: 'Nước hoa nam hương gỗ ấm áp',
      images: [
        'https://images.unsplash.com/photo-1541643600914-78b084683601?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyZnVtZXxlbnwwfHwwfHx8MA%3D%3D',
        'https://plus.unsplash.com/premium_photo-1679106770086-f4355693be1b?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyZnVtZXxlbnwwfHwwfHx8MA%3D%3D',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['50ml', '100ml']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '019_50ml',
          sku: 'PF019-50ML',
          price: 12,
          salePrice: 10,
          stock: 8,
          image:
              'https://images.unsplash.com/photo-1541643600914-78b084683601?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyZnVtZXxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Size': '50ml'},
        ),
        ProductVariationModel(
          id: '019_100ml',
          sku: 'PF019-100ML',
          price: 10,
          salePrice: 15,
          stock: 5,
          image:
              'https://images.unsplash.com/photo-1547887537-6158d64c35b3?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cGVyZnVtZXxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Size': '100ml'},
        ),
      ],
      brand: BrandModel(
        id: 'brand19',
        name: 'LuxuryScents',
        image: 'https://example.com/brands/luxuryscents.jpg',
      ),
    ),

    // 20. Bộ bàn ăn 6 món
    ProductModel(
      id: '020',
      title: 'Bộ bàn ăn cao cấp',
      stock: 12,
      price: 25,
      salePrice: 22,
      thumbnail:
          'https://images.unsplash.com/photo-1554042861-c5b9add98f2c?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGluZXJ3YXJlfGVufDB8fDB8fHww',
      productType: ProductType.variation.name,
      description: 'Bộ bàn ăn 6 món chất liệu sứ cao cấp',
      isFeatured: true,
      images: [
        'https://images.unsplash.com/photo-1554042861-c5b9add98f2c?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGluZXJ3YXJlfGVufDB8fDB8fHww',
        'https://plus.unsplash.com/premium_photo-1709560427978-0043cfa1aee5?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZGluZXJ3YXJlfGVufDB8fDB8fHww',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Blue', 'Gold']),
        ProductAttributeModel(name: 'Pattern', values: ['Floral', 'Plain']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '020_white_floral',
          sku: 'DW020-WHITE-FL',
          price: 25,
          salePrice: 25,
          stock: 5,
          image:
              'https://plus.unsplash.com/premium_photo-1695758787784-d85c1e00ac82?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzN8fGRpbmVyd2FyZXxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'White', 'Pattern': 'Floral'},
        ),
        ProductVariationModel(
          id: '020_blue_plain',
          sku: 'DW020-BLUE-PL',
          price: 25,
          salePrice: 22,
          stock: 4,
          image:
              'https://plus.unsplash.com/premium_photo-1664457234291-77ea39eb0803?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fGRpbmVyd2FyZXxlbnwwfHwwfHx8MA%3D%3D',
          attributeValues: {'Color': 'Blue', 'Pattern': 'Plain'},
        ),
      ],
      brand: BrandModel(
        id: 'brand20',
        name: 'HomeElite',
        image: 'https://example.com/brands/homeelite.jpg',
      ),
    ),
  ];

  final List<BrandModel> brands = [
    BrandModel(
      id: 'nike',
      name: 'Nike',
      image: 'https://i.pinimg.com/1200x/f0/02/8b/f0028bd01a501dd2228704c0668a145d.jpg',
      isFeatured: true,
      productsCount: 128,
    ),
    BrandModel(
      id: 'adidas',
      name: 'Adidas',
      image:
          'https://i.pinimg.com/1200x/91/41/ae/9141ae5ccfa0ea4ff7b9e9f6afd4305e.jpg',
      isFeatured: true,
      productsCount: 105,
    ),
    BrandModel(
      id: 'puma',
      name: 'Puma',
      image: 'https://i.pinimg.com/1200x/a6/ab/1b/a6ab1bdff407f2d45eba7e824b462644.jpg',
      isFeatured: true,
      productsCount: 78,
    ),
    BrandModel(
      id: 'underarmour',
      name: 'Under Armour',
      image:
          'https://i.pinimg.com/736x/ad/74/9c/ad749c6393914f52e42427b0548203bf.jpg',
      isFeatured: false,
      productsCount: 62,
    ),
    BrandModel(
      id: 'newbalance',
      name: 'New Balance',
      image:
          'https://i.pinimg.com/736x/b8/bb/17/b8bb17513c3fe68ea0e8d436f04ce2b0.jpg',
      isFeatured: false,
      productsCount: 55,
    ),
    BrandModel(
      id: 'reebok',
      name: 'Reebok',
      image:
          'https://i.pinimg.com/1200x/6b/c6/03/6bc603dea673eb4161041b046c532225.jpg',
      isFeatured: false,
      productsCount: 40,
    ),
    BrandModel(
      id: 'converse',
      name: 'Converse',
      image:
          'https://i.pinimg.com/736x/5e/ec/de/5eecdee0003031cb83fd90fa75d23d87.jpg',
      isFeatured: true,
      productsCount: 30,
    ),
    BrandModel(
      id: 'vans',
      name: 'Vans',
      image: 'https://i.pinimg.com/736x/fd/74/de/fd74de892276f8bdd13ddd53eb0288a3.jpg',
      isFeatured: false,
      productsCount: 45,
    ),
    BrandModel(
      id: 'fila',
      name: 'FILA',
      image: 'https://i.pinimg.com/736x/95/f3/9b/95f39b2b24a6a37c7b15170ebaf38a62.jpg',
      isFeatured: false,
      productsCount: 28,
    ),
    BrandModel(
      id: 'asics',
      name: 'Asics',
      image:
          'https://i.pinimg.com/1200x/53/ba/6b/53ba6bbd38c479fdd3db3dad044248a2.jpg',
      isFeatured: false,
      productsCount: 20,
    ),
  ];
}
