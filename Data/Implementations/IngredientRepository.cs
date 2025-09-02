using Repository2025.Data.Helpers;
using Repository2025.Data.Interfaces;
using Repository2025.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Data.Implementations
{
    internal class IngredientRepository : IIngredientRepository
    {
        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public List<Ingredient> GetAll()
        {
            List<Ingredient> lst = new List<Ingredient>();

            // Traer registros de la BD
            var dt = DataHelper.GetInstance().ExecuteSpQuery("SP_RECUPERAR_INGREDIENTES");

            // Mapear cada DataRow a un Ingredient
            foreach (DataRow row in dt.Rows)
            {
                Ingredient i = new Ingredient();
                i.Codigo = (int)row["codigo"];
                i.Nombre = (string)row["n_ingrediente"];
                i.Codigo_Producto = (int)row["codigo_producto"];
                i.Cantidad = (double)row["cantidad"];
                i.Unidad = (string)row["unidad"];

                lst.Add(i);
            }

            return lst;
        }

        public Ingredient? GetById(int id)
        {
            // Preparar parámetros
            List<SpParameter> param = new List<SpParameter>()
            {
                new SpParameter()
                {
                    Name = "@codigo",
                    Valor = id
                }
            };

            // Traemos el registro correspondiente a través del SP
            var dt = DataHelper.GetInstance().ExecuteSpQuery("SP_RECUPERAR_INGREDIENTE_POR_CODIGO", param);

            // Si vino un registro, lo mapeamos a Ingredient y lo retornamos
            if (dt != null && dt.Rows.Count > 0)
            {
                Ingredient i = new Ingredient()
                {
                    Codigo = (int)dt.Rows[0]["codigo"],
                    Nombre = (string)dt.Rows[0]["n_ingrediente"],
                    Codigo_Producto = (int)dt.Rows[0]["codigo_producto"],
                    Cantidad = (double)dt.Rows[0]["cantidad"],
                    Unidad = (string)dt.Rows[0]["unidad"]
                };

                return i;
            }

            return null;
        }

        public bool Save(Ingredient ingredient)
        {
            bool exito;

            // Preparar parámetros
            List<SpParameter> param = new List<SpParameter>()
            {
                new SpParameter()
                {
                    Name = "@codigo_producto",
                    Valor = ingredient.Codigo_Producto
                },
                new SpParameter()
                {
                    Name = "@nombre",
                    Valor = ingredient.Nombre
                },
                new SpParameter()
                {
                    Name = "@cantidad",
                    Valor = ingredient.Cantidad
                },
                new SpParameter()
                {
                    Name = "@unidad",
                    Valor = ingredient.Unidad
                }
            };

            exito = DataHelper.GetInstance().ExecuteSpDml("SP_GUARDAR_INGREDIENTE", param);

            return exito;
        }
    }
}
