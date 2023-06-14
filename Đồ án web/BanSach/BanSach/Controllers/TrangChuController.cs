using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class TrangChuController : Controller
    {
        QLBanSachEntities db = new QLBanSachEntities();
        // GET: TrangChu
        public ActionResult Index(string searchBy, string Search)
        {
            if (searchBy == "Name")
                return View(db.Products.Where(s => s.Title.StartsWith(Search)).ToList());
            else if (searchBy == "SpDecription")
                return View(db.Products.Where(s => s.Description.StartsWith(Search)).ToList());
            else
                return View(db.Products.ToList());
        }
       
        public ActionResult Details(int id)
        {
            return View(db.Products.Where(s => s.ID == id).FirstOrDefault());
        }
    }
}