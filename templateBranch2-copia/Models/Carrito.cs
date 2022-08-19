using System.Collections.Generic;
using System;
namespace templateBranch2.Models
{

    public class Carrito
    {
        public List<Producto> ListaProductos = new List<Producto>();
        

        public void AgregarProducto(Producto Prod)
        {
            ListaProductos.Add(Prod);
        }

        public List<Producto> ListarProductos()
        {
            return ListaProductos;
        }

         public float PrecioTotal(List<Producto> ListaProductos){
           
           float precioFinal = 0;
          
            foreach(Producto item in ListaProductos)
            {   
                     
                    
                     precioFinal =  precioFinal + (item.precio * item.cantidad)  ;
            }
            

            return precioFinal;
         }

        
        public List<Producto> sumarCantidad(int idProducto)
        {
            foreach(Producto item in ListaProductos)
            {
                if(item.idProducto == idProducto)
                {
                    item.cantidad = item.cantidad + 1;
                }
            }

            return ListaProductos;
        }
 List<Producto> listaBorrar = new List<Producto>();
         public List<Producto> restarCantidad(int idProducto)
        {
          
            foreach(Producto item in ListaProductos)
            {  
                if(item.idProducto == idProducto)
                {
                    item.cantidad = item.cantidad - 1;
                  if(item.cantidad==0){
                
                listaBorrar.Add(item);
                                      }
                }
            
            }
            ListaProductos.RemoveAll(lp => listaBorrar.Any(lb => lb.idProducto == lp.idProducto));

            return ListaProductos;
        }
        public List<Producto> borrarProducto(int idProducto)
        {
            foreach(Producto item in ListaProductos)
            {  
                if(item.idProducto == idProducto)
                {
            
                listaBorrar.Add(item);
                                     
                }
            
            }
            ListaProductos.RemoveAll(lp => listaBorrar.Any(lb => lb.idProducto == lp.idProducto));

            return ListaProductos;
        }
      
    }
}

