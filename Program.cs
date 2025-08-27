using Repository2025.Domain;
using Repository2025.Services;

// Instanciamos el Service
ProductService oService = new ProductService();

// Obtener todos los productos - GetAll
Console.WriteLine("Obtener todos los productos - GetAll");

// Llamamos al Service
List<Product> lp = oService.GetProducts();

// Manejamos la respuesta
if (lp.Count > 0)
    foreach (Product p in lp)
        Console.WriteLine(p);
else
    Console.WriteLine("No hay productos...");

// Obtener un producto por id - GetById
Console.WriteLine("\nObtener un producto por id - GetById");

// Llamamos al Service
Product? producto5 = oService.GetProductById(5);

// Manejamos la respuesta
if (producto5 != null)
{
    Console.WriteLine(producto5);
}
else
{
    Console.WriteLine("No hay producto con ese id");
}

