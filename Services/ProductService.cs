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
        private IProductRepository _repository;
        public ProductService()
        {
            _repository = new ProductRepository();
        }
        public List<Product> GetProducts()
        {
            return _repository.GetAll();
        }
        public bool SaveProduct(Product product)
        {
            return _repository.Save(product);
        }
     }
}
