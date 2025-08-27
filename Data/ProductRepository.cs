using Repository2025.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Data
{
    public class ProductRepository : IProductRepository
    {
        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public List<Product> GetAll()
        {
            List<Product> lst = new List<Product>();
            
            // Traer registros de la BD
            var dt = DataHelper.GetInstance().ExecuteSPQuery("SP_RECUPERAR_PRODUCTOS");

            // Mapear cada DataRow a un Product
            foreach (DataRow row in dt.Rows)
            {
                Product p = new Product();
                p.Codigo = (int)row["codigo"];
                p.Nombre = (string)row["n_producto"];
                p.Precio = (double)row["precio"];
                p.Stock = (int)row["stock"];
                p.Activo = (bool)row["esta_activo"];
                lst.Add(p);
            }

            return lst;
        }

        public Product? GetById(int id)
        {
            List<ParametroSP> param = new List<ParametroSP>()
            {
                new ParametroSP()
                {
                    Name = "@codigo",
                    Valor = id
                }
            };

            //List<ParametroSP> param2 = new List<ParametroSP>();
            //ParametroSP p = new ParametroSP();
            //p.Valor = id;
            //p.Name = "codigo";
            //param2.Add(p);

            var dt = DataHelper.GetInstance().ExecuteSPQuery("SP_RECUPERAR_PRODUCTO_POR_CODIGO", param);

            if (dt != null && dt.Rows.Count > 0)
            {
                Product p = new Product()
                {
                    Codigo = (int)dt.Rows[0]["codigo"],
                    Nombre = (string)dt.Rows[0]["nombre"],
                    Precio = (double)dt.Rows[0]["precio"],
                    Stock = (int)dt.Rows[0]["stock"],
                    Activo = (bool)dt.Rows[0]["esta_activo"]
                };

                return p;
            }

            return null;
        }

        public bool Save(Product product)
        {
            throw new NotImplementedException();
        }
    }
}
