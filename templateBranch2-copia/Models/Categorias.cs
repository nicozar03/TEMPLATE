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
    public class Categorias
    {
        private int _idCategoria;
        private string _nombre;
        
        
    

        public int idCategoria {
            get { return _idCategoria;}
            set{
                _idCategoria= value;
            }
        }
       
         public string nombre {
            get { return _nombre;}
            set{
                _nombre = value;
            }
        }
      

       

        public Categorias(int idSubcategoria, string nombre, int idCategoria){
            
            _nombre=nombre;
           
        
        }

        public Categorias(){
            
        }


    }
}