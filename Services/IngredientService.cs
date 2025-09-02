using Repository2025.Data;
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
    public class IngredientService
    {
        private IIngredientRepository _repository;
        public IngredientService()
        {
            _repository = new IngredientRepository();
        }

        public List<Ingredient> GetIngredients()
        {
            return _repository.GetAll();
        }

        public Ingredient? GetIngredient(int id)
        {
            return _repository.GetById(id);
        }

        public bool SaveIngredient(Ingredient ingredient)
        {
            return _repository.Save(ingredient);
        }
    }
}
