using Repository2025.Domain;
using Repository2025.Services;

ProductService oService = new ProductService();

List<Product> lp = oService.GetProducts();

if (lp.Count > 0)
    foreach (Product p in lp)
        Console.WriteLine(p);
else
    Console.WriteLine("No hay productos...");

Product? producto5 = oService.GetProductById(5);
if (producto5 != null)
{
    Console.WriteLine(producto5);
}
else
{
    Console.WriteLine("No hay producto con ese id");
}

