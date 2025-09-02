using Repository2025.Domain;
using Repository2025.Services;
using System.Collections.Generic;

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
    Console.WriteLine("No hay un producto con Código = 5.");
}

// Eliminar un producto por id - DeleteProduct
Console.WriteLine("\nEliminar un producto por id - DeleteProduct");

// Llamamos al Service
bool resultDelete = oService.DeleteProduct(5);

// Manejamos la respuesta
if (resultDelete)
{
    Console.WriteLine("Se ha eliminado el producto con Código = 5.");
}
else
{
    Console.WriteLine("No hay un producto con Código = 5.");
}

// Crear un nuevo producto - SaveProduct
Console.WriteLine("\nCrear un nuevo producto - SaveProduct");

// Creamos el objeto


// Llamamos al Service


// Manejamos la respuesta