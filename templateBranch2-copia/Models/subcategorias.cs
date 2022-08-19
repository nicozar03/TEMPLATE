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
    public class subCategorias
    {
        private int _idSubcategoria;
        private string _nombre;
        
        private int _idCategoria;
    


        public int idSubcategoria {
            get { return _idSubcategoria;}
            set{
                _idSubcategoria= value;
            }
        }
         public string nombre {
            get { return _nombre;}
            set{
                _nombre = value;
            }
        }
       public int idCategoria {
            get { return _idCategoria;}
            set{
                _idCategoria= value;
            }
        }

       

        public subCategorias(int idSubcategoria, string nombre, int idCategoria){
            _idSubcategoria =idSubcategoria;
            _nombre=nombre;
            _idCategoria=idCategoria;
        
        }

        public subCategorias(){
            
        }


    }
}