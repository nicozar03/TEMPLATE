using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Dapper;
namespace templateBranch2.Models
{
    [Serializable]
    public class Producto
    {
        private int _idProducto;
        private string _nombre;
        private string _descripcion;
        private string _foto;
        private string _marca;
        private float _precio;
        private int _stock;
        private bool _destacado;

        private int _cantidad;
        private int _idSubCategoria;
        private int _idCategoria;


        public int idProducto {
            get { return _idProducto;}
            set{
                _idProducto= value;
            }
        }

        public string nombre {
            get { return _nombre;}
            set{
                _nombre = value;
            }
        }

        public string descripcion {
            get { return _descripcion;}
            set{
                _descripcion = value;
            }
        }

        public string foto {
            get { return _foto;}
            set{
                _foto = value;
            }
        }
        public string marca {
            get { return _marca;}
            set{
                _marca = value;
            }
        }

        public float precio {
            get { return _precio;}
            set{
                _precio = value;
            }
        }

        public int stock {
            get { return _stock;}
            set{
                _stock = value;
            }
        }
        public bool destacado {
            get { return _destacado;}
            set{
                _destacado = value;
            }
        }
         public int cantidad {
            get { return _cantidad;}
            set{
                _cantidad = value ;
            }
        }

          public int idSubCategoria {
            get { return _idSubCategoria;}
            set{
                _idSubCategoria= value;
            }
        }
              public int idCategoria {
            get { return _idCategoria;}
            set{
                _idCategoria= value;
            }
        }

        public Producto(int idProducto, string nombre, string descripcion, string foto, string marca, float precio, int stock, bool destacado, int cantidad, int idSubCategoria, int idCategoria){
            _idProducto =idProducto;
            _nombre=nombre;
            _descripcion=descripcion;
            _foto = foto;
            _marca = marca;
            _precio = precio;
            _stock = stock;
            _destacado = destacado;
            _cantidad = cantidad;
            _idSubCategoria = idSubCategoria;
            _idCategoria = idCategoria;
        }

        public Producto(){
            
        }







    }
}