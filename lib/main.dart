import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == 'cristian@gmail.com' && password == '1234' || email == '' && password == '' ) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductsPage()),
      );
    } else {
      // Mostrar un diálogo de error si las credenciales son incorrectas
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Correo o contraseña incorrectos'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Puedes añadir funcionalidad para retroceder aquí
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: ClipOval(  // Usamos ClipOval para que la imagen se ajuste bien al círculo
                child: Image.asset(
                  'assets/images/logo3.png',  // Ruta de la imagen en tus assets
                  width: 80,   // Ajustamos el tamaño de la imagen dentro del círculo
                  height: 80,
                  fit: BoxFit.cover,  // Asegura que la imagen cubra todo el círculo
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              thickness: 1,
              color: Colors.green,
              indent: 100,
              endIndent: 100,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Funcionalidad para recuperar contraseña
                },
                child: const Text('¿Olvidó su contraseña?'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Funcionalidad para crear una cuenta nueva
              },
              child: const Text('¿No tienes una cuenta?'),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _currentIndex = 0; // Índice actual de la pestaña seleccionada

  // Lista de pantallas para cada pestaña
  final List<Widget> _pages = [
    const ProductsPageBody(), // Página de Domicilios
    const NewProductPage(), // Placeholder para Productos
    const Center(child: Text('Inventario')), // Placeholder para Inventario
    const IncomesPage(), // Página de Ingresos
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Muestra la página correspondiente al índice actual
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cambia el índice actual al tocar una pestaña
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Domicilios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Ingresos',
          ),
        ],
      ),
    );
  }
}

// Página de Domicilios (contenido de ProductsPage original)
class ProductsPageBody extends StatelessWidget {
  const ProductsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {Navigator.pop(context);},
        ),
        title: Center( // Esto centra el widget de título
          child: Image.asset(
            'assets/images/logo1.png', // Ruta de tu imagen en la carpeta 'assets'
            height: 40, // Ajusta el tamaño de la imagen si es necesario
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Domicilios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ProductCard(
                    imageUrl: 'assets/images/hamburguesa.jpg',
                    title: 'Hamburguesa de Pollo',
                    subtitle: 'Hamburguesa con pollo panizado, acompañado de papas.',
                    price: '\$20.000',
                  ),
                  ProductCard(
                    imageUrl: 'assets/images/pizza.jpg',
                    title: 'Pizza de champiñoes',
                    subtitle: 'Pizza mediana de 1 sabor',
                    price: '\$17.000',
                  ),
                  ProductCard(
                    imageUrl: 'assets/images/sandwich.jpg',
                    title: 'Sandwitch de jamon',
                    subtitle: 'Sandwitch de jamon y queso con verduras.',
                    price: '\$15.000',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Volver a la pantalla anterior
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Página de productos

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {Navigator.pop(context);},
        ),
        title: Center( // Esto centra el widget de título
          child: Image.asset(
            'assets/images/logo1.png', // Ruta de tu imagen en la carpeta 'assets'
            height: 40, // Ajusta el tamaño de la imagen si es necesario
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Domicilios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  NewProductCard(
                    imageUrl: 'assets/images/hamburguesa.jpg',
                    title: 'Hamburguesa de Pollo',
                    subtitle: 'Hamburguesa con pollo panizado, acompañado de papas.',
                    onButtonPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Información"),
                            content: const Text("Trabajo en proceso"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Cierra el popup
                                },
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  NewProductCard(
                    imageUrl: 'assets/images/pizza.jpg',
                    title: 'Pizza de champiñoes',
                    subtitle: 'Pizza mediana de 1 sabor',
                    onButtonPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Información"),
                            content: const Text("Trabajo en proceso"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Cierra el popup
                                },
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  NewProductCard(
                    imageUrl: 'assets/images/sandwich.jpg',
                    title: 'Sandwitch de jamon',
                    subtitle: 'Sandwitch de jamon y queso con verduras.',
                    onButtonPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Información"),
                            content: const Text("Trabajo en proceso"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Cierra el popup
                                },
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Volver a la pantalla anterior
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






class IncomesPage extends StatelessWidget {
  const IncomesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Ingresos',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(  // Aquí añadimos SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de Ganancias Desplegable
            ExpansionTile(
              title: const Text(
                'Ganancias',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              leading: const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.green,
              ),
              children: [
                // Datos desplegables container 1
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Producto: Hamburguesa de Pollo',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Precio: \$20.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Cantidad Vendida: 6,000',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Total: \$120.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                // Datos desplegables container 2
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Producto: Pizza de champiñoes',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Precio: \$17.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Cantidad Vendida: 15,000',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Total: \$255.000,000',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                // Datos desplegables container 3
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Producto: Sandwitch de jamon',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Precio: \$15.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Cantidad Vendida: 20,000',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Total: \$300.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                // Total Ganancias contenedores
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 40, 158, 44),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Total Ganancias: \$675.000,00',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),

              ],
            ),

            // placeholder 2


            ExpansionTile(
              title: const Text(
                'Egresos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              leading: const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.green,
              ),
              children: [
                // Datos desplegables container 1
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Gastos de produccion:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' -Materias primas: \$70.000,00 ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' -Otros ingredientes:\$10.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' -Envases y paquetes:\$15.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Total: \$95.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                // Datos desplegables container 2
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Gastos operativos:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' -Electricidad: \$54.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' -Agua: \$49.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Total: \$103.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                // Datos desplegables container 3
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Gastos generales:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' -Mantenimiento equipos: \$25.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' -Otros gastos: \$24.000',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Total: \$49.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                // Total Ganancias contenedores
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 40, 158, 44),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Total Ganancias: \$247.000,00',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 16),
            // Gráfico de ejemplo
            const Center(
              child: Text(
                'Ganancias',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            const Center(
              child: Text(
                '\$104.000,00',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            const Center(
              child: Text(
                '%51.64',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            // graficas
            Image.asset(
              'assets/images/graficaB.jpeg', // Ruta de tu imagen en la carpeta 'assets'
              height: 250, // Ajusta el tamaño de la imagen si es necesario
            ),

            // Sección de Ventas Producto
            const Text(
              'Ventas Producto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        Icon(Icons.thumb_up, color: Colors.green, size: 30),
                        SizedBox(height: 8),
                        Text(
                          '1,22,450',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Pizza'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        Icon(Icons.pie_chart, color: Colors.green, size: 30),
                        SizedBox(height: 8),
                        Text(
                          '90%',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('UIS Market'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/grafica2.jpeg', // Ruta de tu imagen en la carpeta 'assets'
              height: 250, // Ajusta el tamaño de la imagen si es necesario
            ),
          ],
        ),
      ),
    );
  }
}






// Widget para las tarjetas de producto
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class NewProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onButtonPressed; // Callback para el botón

  const NewProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: onButtonPressed, // Llama al callback al presionar el botón
        ),
      ),
    );
  }
}
