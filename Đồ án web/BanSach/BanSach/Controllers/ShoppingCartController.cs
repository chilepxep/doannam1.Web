using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class ShoppingCartController : Controller
    {
        QLBanSachEntities db = new QLBanSachEntities();
        // GET: ShoppingCart
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }
        public ActionResult AddtoCart(int id)
        {
            var pro = db.Products.SingleOrDefault(s => s.ID == id);
            if (pro != null)
            {
                GetCart().Add(pro);
            }
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }
        public ActionResult ShowToCart()
        {
            if (Session["Cart"] == null)
            {
                return View("EmptyCart");
            }
            Cart cart = Session["Cart"] as Cart;
            return View(cart);
        }
        public ActionResult Update_Quantity_Cart(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            int id_pro = int.Parse(form["id_Pro"]);
            int quantity = int.Parse(form["Quantity"]);
            cart.Update_Quantity_Shopping(id_pro, quantity);
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }
        public ActionResult RemoveCart(int id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }

        public PartialViewResult BagCart()
        {
            int _t_item = 0;
            Cart cart = Session["Cart"] as Cart;
            if (cart != null)
            {
                _t_item = cart.Total_Quantity();
            }
            ViewBag.infoCart = _t_item;
            return PartialView("BagCart");
        }

        public ActionResult CheckOut(FormCollection form)
        {
            try
            {
                Cart cart = Session["Cart"] as Cart;
                Order _order = new Order();
                _order.User_id = int.Parse(form["iduser"]);
                _order.Fullname = form["hovaten"];
                _order.Email = form["email"];
                _order.Phone_number = int.Parse(form["sdt"]);
                _order.Address = form["diachi"];
                _order.Note = form["ghichu"];
                _order.Oder_date = DateTime.Now;
                db.Orders.Add(_order);
                foreach(var item in cart.Items)
                {
                    Order_Details _order_Detail = new Order_Details();
                    _order_Detail.Order_id = _order.ID;
                    _order_Detail.Product_id = item._shopping_product.ID;
                    _order_Detail.Price = item._shopping_product.Discount;
                    _order_Detail.Num = item._shopping_quantity;
                    db.Order_Details.Add(_order_Detail);
                }
                db.SaveChanges();
                cart.ClearCart();
                return RedirectToAction("Shopping_Success", "ShoppingCart");
            }
            catch
            {
                return Content("error checkout");
            }
        }

        public ActionResult Shopping_Success()
        {
            return View();
        }
    }
}