using Repository2025.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Data.Interfaces
{
    public interface IIngredientRepository
    {
        List<Ingredient> GetAll();
        Ingredient? GetById(int id);
        bool Save(Ingredient ingredient);
        bool Delete(int id);
    }
}
