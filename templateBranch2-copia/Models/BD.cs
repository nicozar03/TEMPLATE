using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Data;
using Dapper;


namespace templateBranch2.Models
{
    public static class BD
    {   
        private static List<Producto> _ListaProducto = new List<Producto> ();
         private static List<subCategorias> _listaProductosSubcategoria = new List<subCategorias> ();
         
         
         
         private static List<subCategorias> _ListasubCategorias = new List<subCategorias> ();
         private static List<Categorias> _ListaCategorias = new List<Categorias> ();
         
         
         private static List<Producto> _ListaProductosEspecialidad = new List<Producto> ();

       // private static List<Especialidad> _ListaEspecialidad = new List<Especialidad> ();

        public static List<Producto> ListaProductosDestacados(){
            List<Producto> ListaProductosDestacados = new List<Producto> ();
            using(MySqlConnection con = new MySqlConnection("server=localhost;user=root;database=papeleravipdatabase;port=3306;password=VipPapelera2022")){
                string sql="SELECT * from productos WHERE destacado = 1";
                ListaProductosDestacados = con.Query<Producto>(sql).ToList();
            }
            return ListaProductosDestacados;
        }
        public static List<Producto> ListaProductos(){
            List<Producto> ListaProductos = new List<Producto> ();
            using(MySqlConnection con = new MySqlConnection("server=localhost;user=root;database=papeleravipdatabase;port=3306;password=VipPapelera2022")){
                string sql="SELECT * from productos";
                ListaProductos = con.Query<Producto>(sql).ToList();
            }
            return ListaProductos;
        }
          public static List<Producto> ListarProductosxSubCategorias(int idSubcategoria){
            List<Producto> listaProductosSubcategoria= new List<Producto> ();
           using(MySqlConnection con = new MySqlConnection("server=localhost;user=root;database=papeleravipdatabase;port=3306;password=VipPapelera2022")){
                string sql="SELECT * from productos where idSubcategoria = @pidSubcategoria";
                listaProductosSubcategoria = con.Query<Producto>(sql, new{pidSubcategoria = idSubcategoria}).ToList();
            }
            return listaProductosSubcategoria;
        }

        public static List<subCategorias> ListarsubCategorias(){
            List<subCategorias> ListasubCategorias= new List<subCategorias> ();
            using(MySqlConnection con = new MySqlConnection("server=localhost;user=root;database=papeleravipdatabase;port=3306;password=VipPapelera2022")){
                string sql="SELECT * from subCategorias";
                ListasubCategorias = con.Query<subCategorias>(sql).ToList();
            }
            return ListasubCategorias;
        }
          public static List<Categorias> ListarCategorias(){
            List<Categorias> ListaCategorias= new List<Categorias> ();
            using(MySqlConnection con = new MySqlConnection("server=localhost;user=root;database=papeleravipdatabase;port=3306;password=VipPapelera2022")){
                string sql="SELECT * from Categorias";
                ListaCategorias = con.Query<Categorias>(sql).ToList();
            }
            return ListaCategorias;
        }

       public static Producto ConsultaProducto(int idProducto){
            Producto UnProducto = null;
            using(MySqlConnection con = new MySqlConnection("server=localhost;user=root;database=papeleravipdatabase;port=3306;password=VipPapelera2022")){
                string sql="SELECT * from productos WHERE idProducto = @pidProducto";
                UnProducto = con.QueryFirstOrDefault<Producto>(sql, new{pidProducto = idProducto});
            }
            return UnProducto;
        }

           public static List<Producto> ConsultaEspecialidad(int idCategoria){
            List<Producto>  ListaProductosEspecialidad =new List<Producto> ();
            using(MySqlConnection con = new MySqlConnection("server=localhost;user=root;database=papeleravipdatabase;port=3306;password=VipPapelera2022")){
                string sql="SELECT * from productos WHERE idCategoria = @pidCategoria";
                ListaProductosEspecialidad = con.Query<Producto>(sql,new{pidCategoria = idCategoria}).ToList();
            }
            return ListaProductosEspecialidad;
        }


        /*public static Especialidad ConsultaEspecialidad(int IdEspecialidad){
            Especialidad UnaEspecialidad = null;
            using(SqlConnection db = new SqlConnection(_connectionString)){
                string sql="SELECT * from Especialidades WHERE IdEspecialidad = @pIdEspecialidad";
                UnaEspecialidad = db.QueryFirstOrDefault<Especialidad>(sql, new{pIdEspecialidad = IdEspecialidad});
            }
            return UnaEspecialidad;
        }

        public static List<CursosConEspecialidad> ListarCursos(int IdEspecialidad){
        
            List<CursosConEspecialidad> ListaCurso = new List<CursosConEspecialidad> ();
            string sql;
            if(IdEspecialidad==-1){
                sql="select Cursos.IdCurso, Cursos.Nombre, Cursos.Descripcion, Cursos.Imagen, Cursos.UrlCurso, Cursos.MeGusta, Cursos.NoMeGusta, Especialidades.Nombre as NombreEspecialidad, Especialidades.Materia, Especialidades.IdEspecialidad from Especialidades inner join Cursos on Especialidades.IdEspecialidad = Cursos.IdEspecialidad";
                using(SqlConnection db = new SqlConnection(_connectionString)){
                ListaCurso  = db.Query<CursosConEspecialidad>(sql).ToList();
                }
            }
            else{
                sql="select Cursos.IdCurso,Cursos.Nombre, Cursos.Descripcion, Cursos.Imagen, Cursos.UrlCurso, Cursos.MeGusta, Cursos.NoMeGusta, Especialidades.Nombre as NombreEspecialidad, Especialidades.Materia, Especialidades.IdEspecialidad from Especialidades inner join Cursos on Especialidades.IdEspecialidad = Cursos.IdEspecialidad WHERE Cursos.IdEspecialidad=@pIdEspecialidad " ; 
                using(SqlConnection db = new SqlConnection(_connectionString)){
                    ListaCurso = db.Query<CursosConEspecialidad>(sql, new{pIdEspecialidad = IdEspecialidad}).ToList();
                }
            }
            return ListaCurso;
        }
      
      
        public static List<Especialidad> ListaEspecialidad(){
            List<Especialidad> ListaEspecialidad = new List<Especialidad> ();
            using(SqlConnection db = new SqlConnection(_connectionString)){
                string sql="SELECT * from Especialidades";
                ListaEspecialidad = db.Query<Especialidad>(sql).ToList();
            }
            return ListaEspecialidad;
        }

        public static void ProductoNuevo(string nombre, string descripcion, string foto, string marca, float precio, int stock, bool destacado){
            string sql="Insert into productos(nombre, descripcion, foto, marca, precio, stock, destacado) values(@pnombre, @pdescripcion, @pfoto, @pmarca, @pprecio, @pstock, @pdestacado ) ";
            using(SqlConnection db = new SqlConnection(_connectionString)){
             db.Execute(sql, new{pnombre=nombre,pdescripcion=descripcion,pfoto=foto,pmarca=marca,pprecio=precio,pstock=stock,pdestacado=destacado});
            } 
        } 


        public static void Calificar(int IdCurso, bool calificacion){
            string sql=null;
            if(calificacion==true){
                sql="UPDATE Cursos SET MeGusta=MeGusta+1 WHERE IdCurso=@pIdCurso";
            }
            if(calificacion==false){
                sql="UPDATE Cursos SET NoMeGusta=NoMeGusta+1 WHERE IdCurso=@pIdCurso";
            }
            using(SqlConnection db = new SqlConnection(_connectionString)){
                db.Execute(sql, new{pIdCurso = IdCurso});
            }
        }
*/


    }
        


}

