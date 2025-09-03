using Repository2025.Data;
using Repository2025.Data.Helpers;
using Repository2025.Data.Implementations;
using Repository2025.Data.Interfaces;
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
            if (product.Stock < 0)
            {
                return false;
            }

            return _repository.Save(product);
        }

        public bool DeleteProduct(int id)
        {
            // Verificamos que exista un producto con el mismo código
            var productEnBD = _repository.GetById(id);

            // Si existe, lo eliminamos

            return productEnBD != null ? _repository.Delete(id) : false;

            // Operador ternario - Sintaxis
            // <expresión_lógica> ? <valor_true> : <valor_false>

            // La línea de arriba es equivalente a este bloque comentado
            /*
             *  bool exito;
             *  if (productEnBD != null)
             *  {
             *      exito = _repository.Delete(id);
             *  }
             *  else
             *  {
             *      exito = false;
             *  }
             *   return exito;
             */
        }

        public bool ExecuteTransaction(Product product)
        {
            return DataHelper.GetInstance().ExecuteTransaction(product);
        }
    }
}
