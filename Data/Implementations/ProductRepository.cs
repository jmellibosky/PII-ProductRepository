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
    public class ProductRepository : IProductRepository
    {
        public bool Delete(int id)
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

            // Eliminamos el registro correspondiente a través del SP
            return DataHelper.GetInstance().ExecuteSpDml("SP_REGISTRAR_BAJA_PRODUCTO", param);
        }

        public List<Product> GetAll()
        {
            List<Product> lst = new List<Product>();
            
            // Traer registros de la BD
            var dt = DataHelper.GetInstance().ExecuteSpQuery("SP_RECUPERAR_PRODUCTOS");

            // Mapear cada DataRow a un Product
            foreach (DataRow row in dt.Rows)
            {
                Product p = new Product();
                p.Codigo = (int)row["codigo"];
                p.Nombre = (string)row["n_producto"];
                //p.Precio = (double)row["precio"];
                p.Stock = (int)row["stock"];
                p.Activo = (bool)row["esta_activo"];
                lst.Add(p);
            }

            return lst;
        }

        public Product? GetById(int id)
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

            // El bloque de arriba es equivalente a este bloque comentado
            /*
             * List<ParametroSP> param2 = new List<ParametroSP>();
             * ParametroSP p = new ParametroSP();
             * p.Valor = id;
             * p.Name = "codigo";
             * param2.Add(p);
             */

            // Traemos el registro correspondiente a través del SP
            var dt = DataHelper.GetInstance().ExecuteSpQuery("SP_RECUPERAR_PRODUCTO_POR_CODIGO", param);

            // Si vino un registro, lo mapeamos a Product y lo retornamos
            if (dt != null && dt.Rows.Count > 0)
            {
                Product p = new Product()
                {
                    Codigo = (int)dt.Rows[0]["codigo"],
                    Nombre = (string)dt.Rows[0]["n_producto"],
                    //Precio = (double)dt.Rows[0]["precio"],
                    Stock = (int)dt.Rows[0]["stock"],
                    Activo = (bool)dt.Rows[0]["esta_activo"]
                };

                return p;
            }

            return null;
        }

        public bool Save(Product product)
        {
            List<SpParameter> param = new List<SpParameter>()
            {
                new SpParameter("@codigo", product.Codigo),
                new SpParameter("@nombre", product.Nombre),
                new SpParameter("@stock", product.Stock)
            };

            return DataHelper.GetInstance().ExecuteSpDml("SP_GUARDAR_PRODUCTO", param);
        }
    }
}
