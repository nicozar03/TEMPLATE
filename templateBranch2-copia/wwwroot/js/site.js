// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
var a_parent =  document.querySelectorAll(".a_parent");
var dd_menu_a = document.querySelectorAll(".dd_menu_a");

a_parent.forEach(function(aitem){

		aitem.addEventListener("click", function(){
			a_parent.forEach(function(aitem){
				aitem.classList.remove("active");
			})
			dd_menu_a.forEach(function(dd_menu_item){
				dd_menu_item.classList.remove("active");
			})
			aitem.classList.add("active");
		})
})

dd_menu_a.forEach(function(dd_menu_item){

		dd_menu_item.addEventListener("click", function(){
			dd_menu_a.forEach(function(dd_menu_item){
				dd_menu_item.classList.remove("active");
			})
			dd_menu_item.classList.add("active");
		})
})
// Write your JavaScript code.
