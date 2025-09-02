using Repository2025.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Data.Interfaces
{
    public interface IProductRepository
    {
        List<Product> GetAll();
        // El signo de interrogación indica que puede devolver null
        Product? GetById(int id);
        bool Save(Product product);
        bool Delete(int id);
    }
}
