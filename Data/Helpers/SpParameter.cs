using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Data.Helpers
{
    // Clase para representar un parámetro de un Stored Procedure
    public class SpParameter
    {
        public string Name { get; set; }
        public object Valor { get; set; }

        public SpParameter() { }

        public SpParameter(string name, object valor)
        {
            this.Name = name;
            this.Valor = valor;
        }
    }
}
