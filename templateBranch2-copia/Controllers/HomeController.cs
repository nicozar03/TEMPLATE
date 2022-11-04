using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using templateBranch2.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace templateBranch2.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {


        List<Producto> ListaProductos = new List<Producto>();
        ListaProductos = BD.ListaProductosDestacados(); 
        ViewBag.Producto = ListaProductos;
        
        
       


        
       
        
        return View();
    }
    
    public IActionResult detalleProductos(int idProducto, string descripcion, string nombre)
    {
        Producto producto;
        producto = BD.ConsultaProducto(idProducto);
        ViewBag.producto = producto;
       

        return View("detalleProducto");
    }

    public IActionResult productosCategorias(int idCategoria)
    {
       List<Producto> ListaProductosEspecialidad = new List<Producto>();
        ListaProductosEspecialidad = BD.ConsultaEspecialidad(idCategoria);
        ViewBag.listadoProductosEspecialidad = ListaProductosEspecialidad;

        return View("paginaProductos");
    }

    public IActionResult productos(int idCategoria,int idProducto)
    {
  
        
        List<Producto> ListaProductosAll = new List<Producto>();
        ListaProductosAll=BD.ListaProductos();
        ViewBag.Productos = ListaProductosAll;
        return View("productos");
    }
     public IActionResult utilesEscolares()
    {
         List<Producto> ListaProductosEspecialidad = new List<Producto>();
        ListaProductosEspecialidad = BD.ConsultaEspecialidad(1);
        ViewBag.listadoProductosEspecialidad = ListaProductosEspecialidad;
        
        return View("utilesEscolares");
    }
    public IActionResult insumosComputacion()
    {
          List<Producto> ListaProductosEspecialidad = new List<Producto>();
        ListaProductosEspecialidad = BD.ConsultaEspecialidad(2);
        ViewBag.listadoProductosEspecialidad = ListaProductosEspecialidad;
        
        return View("insumosComputacion");
    }
   
    public IActionResult libreriaTecnica()
    {
         List<Producto> ListaProductosEspecialidad = new List<Producto>();
        ListaProductosEspecialidad = BD.ConsultaEspecialidad(3);
        ViewBag.listadoProductosEspecialidad = ListaProductosEspecialidad;
        
        return View("libreriaTecnica");
    }
     public IActionResult productosSubcategorias(int idSubCategoria)
    {
         List<Producto> ListaProductosSubcategoria = new List<Producto>();
        ListaProductosSubcategoria = BD.ListarProductosxSubCategorias(idSubCategoria);
        ViewBag.listadoProductosSubcategorias = ListaProductosSubcategoria;
        
        return View("productosSubcategoria");
    }
    public IActionResult FAQ()
    {
        return View();
    }
    public IActionResult contacto()
    {
        return View();
    }

    public IActionResult IniciarCarrito()
    {
        Carrito MiCarrito = new Carrito();
        ViewBag.Carrito = MiCarrito;
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);
        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.visits = HttpContext.Session.GetString("Carrito");
    return RedirectToAction("Index", "Home");
    }
    public IActionResult carrito()
    {   
          var visitString = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(visitString);

                        
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);


        ViewBag.visits2 = MiCarritoString;

        HttpContext.Session.SetString("Carrito", MiCarritoString);

        ViewBag.Carrito = MiCarrito;
        return View("Carrito");
    }

    [HttpGet]
    public IActionResult AgregarProducto(int idProducto, string nombre, string descripcion, string foto, string marca, float precio, int stock, bool destacado, int cantidad, int idSubCategoria, int idCategoria, string foto2, string foto3)
    {
       
        var visitString = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(visitString);

        MiCarrito.AgregarProducto(new Producto(idProducto, nombre, descripcion, foto, marca, precio, stock, destacado, cantidad, idSubCategoria, idCategoria, foto2, foto3));
                        
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);


        ViewBag.visits2 = MiCarritoString;

        HttpContext.Session.SetString("Carrito", MiCarritoString);

        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }
    public IActionResult SumarCantidad(int idProducto)
    {
        var sumarCantidad = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(sumarCantidad);
        MiCarrito.sumarCantidad(idProducto);
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }
     public IActionResult RestarCantidad(int idProducto)
    {
        var borrarCantidad = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(borrarCantidad);
        MiCarrito.restarCantidad(idProducto);
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }

      public IActionResult BorrarProducto(int idProducto)
    {
        var sumarCantidad = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(sumarCantidad);
        MiCarrito.borrarProducto(idProducto);
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }
    public IActionResult Pagar(Carrito MiCarrito)
    {

        return View("Pagar");
    }



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
