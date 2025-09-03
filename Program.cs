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
bool resultDelete = oService.DeleteProduct(4);

// Manejamos la respuesta
if (resultDelete)
{
    Console.WriteLine("Se ha eliminado el producto con Código = 4.");
}
else
{
    Console.WriteLine("No hay un producto con Código = 4.");
}

// Crear un nuevo producto - SaveProduct
Console.WriteLine("\nCrear un nuevo producto - SaveProduct");

// Creamos el objeto
Product myProduct = new Product();
myProduct.Nombre = "Banana";
myProduct.Precio = 150.25;
myProduct.Stock = 50;

// Llamamos al Service
bool resultCreate = oService.SaveProduct(myProduct);

// Manejamos la respuesta
if (resultCreate)
{
    Console.WriteLine("Se ha creado el producto con exito.");
}
else
{
    Console.WriteLine("No se ha podido crear el producto.");
}

myProduct.Codigo = 10;
myProduct.Nombre = "Raul";
myProduct.Stock = 0;
bool resultUpdate = oService.SaveProduct(myProduct);