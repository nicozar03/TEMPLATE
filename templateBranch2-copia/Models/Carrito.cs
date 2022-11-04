using System.Collections.Generic;
using System;
public static class Extensions
{
    public static bool find<T>(this List<T> list, T target) {
        return list.Contains(target);
    }
}
namespace templateBranch2.Models
{

    public class Carrito
    {
        public Dictionary<int,Producto> ListaProductos = new Dictionary<int, Producto>();
        

        public void AgregarProducto(Producto Prod)
        {

        if (ListaProductos.ContainsKey(Prod.idProducto)) {
         ListaProductos[Prod.idProducto].cantidad = ListaProductos[Prod.idProducto].cantidad + Prod.cantidad;
        }
        else {
          ListaProductos.Add(Prod.idProducto, Prod);
        }
            
        }

        public Dictionary<int,Producto> ListarProductos()
        {
            return ListaProductos;
        }

         public float PrecioTotal(Dictionary<int,Producto> ListaProductos){
           
           float precioFinal = 0;
          
            foreach(Producto item in ListaProductos.Values)
            {   
                     
                    
                     precioFinal =  precioFinal + (item.precio * item.cantidad)  ;
            }
            

            return precioFinal;
         }

        
        public Dictionary<int,Producto> sumarCantidad(int idProducto)
        {
            foreach(Producto item in ListaProductos.Values)
            {
                if(item.idProducto == idProducto)
                {
                    item.cantidad = item.cantidad + 1;
                }
            }

            return ListaProductos;
        }
    //List<Producto> listaBorrar = new List<Producto>();


         public Dictionary<int,Producto> restarCantidad(int idProducto)
        {
            Producto ProductoARestar = ListaProductos[idProducto];
            ProductoARestar.cantidad--; 
            if (ProductoARestar.cantidad == 0){
                ListaProductos.Remove(idProducto);
            }
            return ListaProductos;
        }

        public Dictionary<int,Producto> borrarProducto(int idProducto)
        {
            ListaProductos.Remove(idProducto);
            return ListaProductos;
        }
      
    }
}

