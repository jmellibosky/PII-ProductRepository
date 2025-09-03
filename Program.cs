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

// Actualizar datos de un producto - SaveProduct
Console.WriteLine("\nActualizar datos de un producto - SaveProduct");

// Creamos el objeto - es importante establecerle Codigo
Product myProduct2 = new Product();
myProduct2.Codigo = 10;
myProduct2.Nombre = "Raul";
myProduct2.Stock = 0;

// Llamamos al Service
bool resultUpdate = oService.SaveProduct(myProduct);

// Manejamos la respuesta
if (resultUpdate)
{
    Console.WriteLine("Se ha actualizado el producto con exito.");
}
else
{
    Console.WriteLine("No se ha podido actualizar el producto.");
}

// Guardar un producto y sus ingredientes - ExecuteTransaction
Console.WriteLine("\nGuardar un producto y sus ingredientes - ExecuteTransaction");

// Creamos el producto y sus ingredientes
Product complexProduct = new Product()
{
    Nombre = "Monster Watermelon",
    Precio = 2500,
    Stock = 50,
    Ingredients = new List<Ingredient>()
    {
        new Ingredient()
        {
            Nombre = "Cafeína",
            Cantidad = 50,
            Unidad = "mL"
        },
        new Ingredient()
        {
            Nombre = "Azúcar",
            Cantidad = 10,
            Unidad = "g"
        },
        new Ingredient()
        {
            Nombre = "Jugo de Sandía",
            Cantidad = 150,
            Unidad = "mL"
        },
        new Ingredient()
        {
            Nombre = "Colorante Rojo",
            Cantidad = 1,
            Unidad = "%"
        }
    }
};

// Forma tradicional de crear el mismo producto
// Product complexProduct1 = new Product();
// complexProduct1.Nombre = "MonsterWatermelon";
// complexProduct1.Precio = 2500;
// complexProduct1.Stock = 50;
// complexProduct1.Ingredients = new List<Ingredient>();

// Ingredient ingredient1 = new Ingredient();
// ingredient1.Nombre = "Cafeína";
// ingredient1.Cantidad = 50;
// ingredient1.Unidad = "mL";
// complexProduct1.Ingredients.Add(ingredient1);

// Ingredient ingredient2 = new Ingredient();
// ingredient2.Nombre = "Azúcar";
// ingredient2.Cantidad = 10;
// ingredient2.Unidad = "g";
// complexProduct1.Ingredients.Add(ingredient2);

// Ingredient ingredient3 = new Ingredient();
// ingredient3.Nombre = "Jugo de Sandía";
// ingredient3.Cantidad = 150;
// ingredient3.Unidad = "mL";
// complexProduct1.Ingredients.Add(ingredient3);

// Ingredient ingredient4 = new Ingredient();
// ingredient4.Nombre = "Colorante Rojo";
// ingredient4.Cantidad = 1;
// ingredient4.Unidad = "%";
// complexProduct1.Ingredients.Add(ingredient4);

// Llamamos al Service
bool resultTransaction = oService.ExecuteTransaction(complexProduct);

// Manejamos la respuesta
if (resultTransaction)
{
    Console.WriteLine("Se ha creado el producto con exito.");
}
else
{
    Console.WriteLine("No se ha podido crear el producto.");
}