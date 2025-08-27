using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Data
{
    // Clase para representar un parámetro de un Stored Procedure
    public class ParametroSP
    {
        public string Name { get; set; }
        public object Valor { get; set; }
    }
}
