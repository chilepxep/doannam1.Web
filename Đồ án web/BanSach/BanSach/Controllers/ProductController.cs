using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class ProductController : Controller
    {
        QLBanSachEntities db = new QLBanSachEntities();
        // GET: Product
        public ActionResult Index()
        {
            return View(db.Products.ToList());
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Product _product)
        {
            db.Products.Add(_product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            return View(db.Products.Where(m => m.ID == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Delete(int id, Product _product)
        {
           _product= db.Products.Where(m => m.ID == id).FirstOrDefault();
            db.Products.Remove(_product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            return View(db.Products.Where(m => m.ID == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Edit(int id, Product _product)
        {
            _product = db.Products.SingleOrDefault(m => m.ID == id);
            db.Entry(_product).State = System.Data.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
  