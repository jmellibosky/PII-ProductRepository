using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Domain
{
    public class Ingredient
    {
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public int Codigo_Producto { get; set; }
        public double Cantidad { get; set; }
        public string Unidad { get; set; }
    }
}
