using Microsoft.Data.SqlClient;
using Repository2025.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository2025.Data.Helpers
{
    public class DataHelper
    {
        private static DataHelper _instance;
        private SqlConnection _connection;

        private DataHelper()
        {
            _connection = new SqlConnection(Properties.Resources.CadenaConexionLocal);
        }
        public static DataHelper GetInstance()
        {
            if (_instance == null)
            {
                _instance = new DataHelper();
            }
            return _instance;
        }

        public DataTable ExecuteSpQuery(string sp, List<SpParameter>? param = null)
        {
            DataTable dt = new DataTable();        
            try
            {
                // Abrimos la conexión
                _connection.Open();
                var cmd = new SqlCommand(sp, _connection);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agregamos parámetros si los hay
                if (param != null)
                {
                    foreach (SpParameter p in param)
                    {
                        cmd.Parameters.AddWithValue(p.Name, p.Valor);
                    }
                }

                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                // En caso de error, retornamos null
                dt = null;
            }
            finally
            {
                // Cerramos la conexión
                _connection.Close();
            }

            return dt;
        }

        // Método para ejecutar SPs con operaciones DML
        public bool ExecuteSpDml(string sp, List<SpParameter>? param = null)
        {
            bool result;
            try
            {
                // Abrimos la conexión
                _connection.Open();
                var cmd = new SqlCommand(sp, _connection);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agregamos parámetros si los hay
                if (param != null)
                {
                    foreach (SpParameter p in param)
                    {
                        cmd.Parameters.AddWithValue(p.Name, p.Valor);
                    }
                }

                int affectedRows = cmd.ExecuteNonQuery();

                result = affectedRows > 0;
            }
            catch (SqlException ex)
            {
                // En caso de error, retornamos false
                result = false;
            }
            finally
            {
                // Cerramos la conexión
                _connection.Close();
            }

            return result;
        }

        public bool ExecuteTransaction(Product product)
        {
            _connection.Open();

            // Obtener transaccion a partir de conexion
            SqlTransaction transaction = _connection.BeginTransaction();
            var cmd = new SqlCommand("SELECT ", _connection, transaction);

            // Ejecutar los comandos que hagan falta
            // Primero tenemos que crear el maestro PRODUCTOS
            cmd.CommandText = "SP_GUARDAR_PRODUCTO";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@codigo", product.Codigo);
            cmd.Parameters.AddWithValue("@nombre", product.Nombre);
            cmd.Parameters.AddWithValue("@stock", product.Stock);

            int affectedRows = cmd.ExecuteNonQuery();
            if (affectedRows <= 0)
            {
                transaction.Rollback();
                return false;
            }
            else
            {
                // Luego tenemos que crear el detalle INGREDIENTES
                foreach (Ingredient i in product.Ingredients)
                {
                    SqlCommand cmdDetalle = new SqlCommand("", _connection, transaction);
                    cmdDetalle.CommandText = "SP_GUARDAR_INGREDIENTE";
                    cmdDetalle.CommandType = CommandType.StoredProcedure;

                    int codigoProducto = 1;
                    cmdDetalle.Parameters.AddWithValue("@codigo_producto", codigoProducto);
                    cmdDetalle.Parameters.AddWithValue("@nombre", i.Nombre);
                    cmdDetalle.Parameters.AddWithValue("@cantidad", i.Cantidad);
                    cmdDetalle.Parameters.AddWithValue("@unidad", i.Unidad);

                    int affectedRowsDetalle = cmdDetalle.ExecuteNonQuery();
                    if (affectedRowsDetalle <= 0)
                    {
                        transaction.Rollback();
                        return false;
                    }
                }

                transaction.Commit();
                return true;
            }


        }
    }
}
