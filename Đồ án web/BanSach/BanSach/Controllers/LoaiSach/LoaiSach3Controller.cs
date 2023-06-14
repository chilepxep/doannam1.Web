using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class LoaiSach3Controller : Controller
    {
        // GET: LoaiSach
        QLBanSachEntities db = new QLBanSachEntities();
        public ActionResult LoaiSach3()
        {
            var result = db.Products.Where(s => s.Category_id == 3);
            return View(result);
        }
    }
}