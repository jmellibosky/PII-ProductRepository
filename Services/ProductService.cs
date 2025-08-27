using Repository2025.Data;
using Repository2025.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Services
{
    public class ProductService
    {
        // Referencia al repositorio de productos a través de su interfaz
        // Esto permite cambiar la implementación del repositorio sin afectar el servicio
        private IProductRepository _repository;
        public ProductService()
        {
            _repository = new ProductRepository();
        }
        
        public List<Product> GetProducts()
        {
            // En algunos casos, no hay lógica de negocio adicional
            return _repository.GetAll();
        }

        public Product? GetProductById(int id)
        {
            return _repository.GetById(id);
        }

        public bool SaveProduct(Product product)
        {
            bool exito;

            // El Service sirve para agregar lógica de negocio según corresponda
            // En este caso, verificamos que no exista un producto con el mismo código
            var productEnBD = _repository.GetById(product.Codigo);

            // Si no existe, lo guardamos
            if (productEnBD == null) {
                exito = _repository.Save(product);
            }
            else
            {
                exito = false;
            }

            return exito;
        }
     }
}
